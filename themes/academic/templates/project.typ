// One project, as a case study: cover, a fact table drawn from the project's
// own frontmatter, the write-up, then the next project.

#import "@baudelaire/html:0.1.0": h
#import "../parts.typ": label, next-project, posted, shell, titlecase, work-links

// The facts a project page shows beside the date, in this order, read from the
// page's own frontmatter. A field the page does not set is simply absent, so a
// site adds `client` or drops `role` by writing frontmatter, not by editing
// this file.
#let _facts = ("role", "client", "duration")

#let project(page, body) = shell(page, h("article", class: "project", {
  h("header", class: "project-head", {
    h("div", class: "project-title", {
      h("h1", page.frontmatter.title)

      // The paper's authors from frontmatter `paper_authors:`, each a
      // `(name:, url:, affiliation:)`, one line of names under the title. An
      // affiliation is a list of institutions, or one string separating them
      // with commas. Each institution is numbered where it first appears, the
      // numbers set after the names like footnote marks, and the institutions
      // listed under the names by their numbers.
      let authors = page.frontmatter.at("paper_authors", default: ())
      if authors.len() > 0 {
        let affiliations = authors.map(author => {
          let affiliation = author.at("affiliation", default: ())
          if type(affiliation) == str { affiliation.split(",").map(str.trim).filter(it => it != "") } else { affiliation }
        })
        let institutions = affiliations.flatten().dedup()

        h("p", class: "paper-authors", authors.zip(affiliations).map(((author, affiliation)) => h("span", {
          let url = author.at("url", default: none)
          if url in (none, "") { author.name } else { h("a", href: url, author.name) }
          if affiliation.len() > 0 {
            h("sup", affiliation.map(it => str(institutions.position(i => i == it) + 1)).join(","))
          }
        })).join(", "))
        if institutions.len() > 0 {
          h("p", class: "paper-affiliations", institutions.enumerate().map(((i, it)) => {
            h("span", { h("sup", str(i + 1)); it })
          }).join(" "))
        }
      }

      let summary = page.frontmatter.at("summary", default: none)
      if summary != none { h("p", class: "tagline", summary) }
    })

    // The facts, then under them the date and the paper, its preprint, the
    // slides..., from frontmatter `links:`, the same pills the work's row in a
    // listing carries, one column beside the title.
    h("div", class: "project-side", {
      h("dl", class: "facts", {
        for key in _facts {
          let value = page.frontmatter.at(key, default: none)
          if value != none {
            h("div", class: "fact", {
              h("dt", label(page, key, titlecase(key)))
              h("dd", value)
            })
          }
        }
        let terms = page.taxonomies.at("stack", default: ())
        if terms.len() > 0 {
          h("div", class: "fact", {
            h("dt", label(page, "stack", "Stack"))
            h("dd", class: "fact-stack", for term in terms {
              h("a", class: "chip", href: "/stack/" + term + "/", term)
            })
          })
        }
      })

      work-links(
        (label: page.frontmatter.title, extra: page.frontmatter),
        path => page.assets.at(path, default: path),
        class: "project-links",
        // The date on its own, without a label, ahead of the pills: it reads
        // as one.
        lead: {
          let date = posted(page.date)
          if date != none { h("span", class: "project-date", date) }
        },
      )
    })
  })

  // No lead image here: `image:` is the picture of the work's row in a listing
  // and of the social card, and a work's own figures sit in its body, so
  // drawing it again on top would show the same picture twice.

  // A link naming a file beside the page (`#link("slides.pdf")`, or a pill
  // such as `#poster("poster.pdf")`) points at where that file is served,
  // which is under the asset tree rather than beside the page's URL.
  h("div", class: "prose", {
    let served(dest) = if type(dest) == str { page.assets.at(dest, default: dest) } else { dest }
    show link: it => {
      let dest = served(it.dest)
      if dest == it.dest { it } else { link(dest, it.body) }
    }
    show html.elem.where(tag: "a"): it => {
      let href = it.attrs.at("href", default: none)
      let dest = served(href)
      if dest == href { it } else { html.elem("a", attrs: it.attrs + (href: dest), it.body) }
    }
    // A figure the page lets float (`#figure(placement: auto, ..)`) sits in
    // the room right of the text, level with where it is declared, rather
    // than breaking the text in two. Where there is no such room, it stays in
    // the text like any other figure. One that may also take the parent's
    // width (`scope: "parent"`) stays in the text, centred on the article
    // and free to spread over its width.
    show figure.where(placement: auto): it => {
      let class = if it.scope == "parent" { "figure-wide" } else { "figure-aside" }
      h("div", class: class, it)
    }
    body
  })
}))
