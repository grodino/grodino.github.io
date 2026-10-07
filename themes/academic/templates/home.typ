// The landing page: the bio beside the news, then the rest of the page.
//
// Bind it from the page's frontmatter (`template: "home.typ"`). The page marks
// its bio with `bio[...]` from `parts.typ`; whatever else its body holds (a
// selection of projects, a list of service) runs below the bio and news, full
// width. A body with no `bio` is all bio.

#import "@baudelaire/html:0.1.0": h
#import "../parts.typ": label, shell

#let home(page, body) = shell(
  page,
  {
    // Split the body at its `bio`: the bio goes in the hero, the rest below.
    let children = if body.has("children") { body.children } else { (body,) }
    let marked = children.find(child => child.at("label", default: none) == <bio>)
    let (bio, rest) = if marked == none { (body, none) } else {
      (marked.value, children.filter(child => child.at("label", default: none) != <bio>).join())
    }

    h("section", class: "hero", {
      // The bio. The page's `image` is the portrait the header draws beside
      // the name, and its `links` the icon row under it.
      h("div", class: "hero-body", bio)

      // Beside the bio, the news: the latest piece in full, then the rest one
      // line each, as many as the stylesheet finds room for. Frontmatter `news` names the file whose `news` list the
      // news page renders, so the column follows that page by itself. A path
      // rather than the list: frontmatter is copied into the page catalogue,
      // which holds plain values and not content.
      let source = page.frontmatter.at("news", default: none)
      let (news, anchor) = if source != none {
        import source: anchor, news
        (news, anchor)
      } else { ((), none) }
      // Each piece links to its heading on the news page.
      let href(item) = "/news/#" + anchor(item.title)
      if news.len() > 0 {
        h("aside", class: "news", aria-labelledby: "news-title", {
          h("h2", class: "news-title", id: "news-title", label(page, "news", "News"))
          let (latest, ..rest) = news
          h("div", class: "news-latest", {
            h("p", class: "news-year", str(latest.date.year()))
            h("p", class: "news-headline", h("a", href: href(latest), latest.title))
            if latest.at("body", default: none) != none { h("div", class: "news-summary", latest.body) }
          })
          if rest.len() > 0 {
            h("ul", class: "news-list", for item in rest {
              // The year inside the link, so the whole line is one target.
              h("li", h("a", href: href(item), {
                h("span", class: "news-year", str(item.date.year()))
                h("span", class: "news-item-title", item.title)
              }))
            })
          }
          h("p", class: "news-more", h("a", href: "/news/", label(page, "all-news", "All news") + " →"))
        })
      }
    })

    // The rest of the body, below the bio and news.
    if rest != none { h("section", class: "prose home-rest", rest) }
  },
)
