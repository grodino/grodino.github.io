// The pieces every layout is built from. Kept at the theme root rather than
// under `templates/`, so a project file can never shadow it by accident: only
// `templates/`, `assets/` and `static/` are layered.
//
// The work grid is the theme. It is drawn once, here, from the row shape both a
// generated listing and the `@baudelaire/pages` catalogue carry, so the landing
// page's selection and the full index at `/work/` are the same component with
// different inputs.

#import "@baudelaire/html:0.1.0": h, svg
#import "@baudelaire/pages:0.1.0": pages
#import "@baudelaire/sections:0.1.0": sections
#import "@baudelaire/site:0.1.0": author, description as site-description, feed-url, feeds, title as site-title

// An icon, as real DOM rather than an `<img>`, so it inherits `currentColor`
// from the text around it. A theme cannot use `svg()`: those paths are
// project-root absolute, and a theme does not know where it was installed.
#let icon(..paths, size: 16) = h(
  "svg",
  class: "icon",
  width: size,
  height: size,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  stroke-width: "1.75",
  stroke-linecap: "round",
  stroke-linejoin: "round",
  aria-hidden: "true",
  ..paths.pos().map(d => h("path", d: d)),
)

#let arrow = icon("M5 12h14", "M13 5l7 7-7 7")

// A UI label, from the site's own string table when it has one, so a
// non-English site translates the theme through config rather than by editing
// it.
#let label(page, key, fallback) = page.strings.at(key, default: fallback)

// `about` -> `About`, for a label built out of a directory name.
#let titlecase(s) = if s == "" { s } else { upper(s.slice(0, count: 1)) + s.slice(1) }

// The nav, derived from the build's own view of the site rather than from a
// menu in config: a new top-level directory or a new page beside the landing
// one shows up on its own, and anything removed cannot leave a dead link.
//
// It opens on the landing page, as `home`. Then three sources, because a site
// has three kinds of top-level thing, listed in this order. `sections` are the content directories with pages in them
// (`/projects/`); the catalogue supplies the directories that are only an index
// page (`/teaching/`), which no section lists, then the pages sitting directly
// under `content/` (`/news/`).
//
// It reads as a path, `/ home / projects / teaching / news`, so each item is labelled
// by its URL segment rather than its title. The slashes are the stylesheet's,
// so an item is one link and a short line breaks between items, never inside.
#let top-nav(page) = {
  let urls = ("/",)
  urls += sections(page.lang).filter(s => s.pages.len() > 0 or s.children.len() > 0).map(s => "/" + s.id + "/")
  let top-level = pages(page.lang).filter(p => p.url.split("/").len() == 3)
  urls += top-level.filter(p => p.collection != "_root").map(p => p.url)
  urls += top-level.filter(p => p.collection == "_root").map(p => p.url)
  h("nav", class: "top-nav", aria-label: label(page, "primary", "Primary"), {
    for url in urls.dedup() {
      // `page` on the item's own index, `true` anywhere beneath it: a
      // project page still lights `projects`, without claiming to be it. Every
      // URL starts with `/`, so `home` lights on the landing page alone.
      let current = if page.url == url { "page" } else if url != "/" and page.url.starts-with(url) { "true" }
      h("a", href: url, aria-current: current, if url == "/" { label(page, "home", "home") } else { url.trim("/") })
    }
  })
}

// The profile logos, from Simple Icons (CC0), solid on a 24×24 grid. LinkedIn
// left Simple Icons after v13, so its path is v13's. The envelope is outlined
// rather than solid, at a stroke that matches the logos' weight.
#let profile-icons = (
  scholar: "M5.242 13.769L0 9.5 12 0l12 9.5-5.242 4.269C17.548 11.249 14.978 9.5 12 9.5c-2.977 0-5.548 1.748-6.758 4.269zM12 10a7 7 0 1 0 0 14 7 7 0 0 0 0-14z",
  github: "M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12",
  bluesky: "M5.202 2.857C7.954 4.922 10.913 9.11 12 11.358c1.087-2.247 4.046-6.436 6.798-8.501C20.783 1.366 24 .213 24 3.883c0 .732-.42 6.156-.667 7.037-.856 3.061-3.978 3.842-6.755 3.37 4.854.826 6.089 3.562 3.422 6.299-5.065 5.196-7.28-1.304-7.847-2.97-.104-.305-.152-.448-.153-.327 0-.121-.05.022-.153.327-.568 1.666-2.782 8.166-7.847 2.97-2.667-2.737-1.432-5.473 3.422-6.3-2.777.473-5.899-.308-6.755-3.369C.42 10.04 0 4.615 0 3.883c0-3.67 3.217-2.517 5.202-1.026",
  linkedin: "M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z",
)

#let profile-icon(name) = if name == "email" {
  h(
    "svg",
    width: 15,
    height: 15,
    viewBox: "0 0 24 24",
    fill: "none",
    stroke: "currentColor",
    stroke-width: "2",
    stroke-linecap: "round",
    stroke-linejoin: "round",
    aria-hidden: "true",
    {
      h("rect", x: "2", y: "4", width: "20", height: "16", rx: "2")
      h("path", d: "M2 6l10 7 10-7")
    },
  )
} else {
  h("svg", width: 15, height: 15, viewBox: "0 0 24 24", fill: "currentColor", aria-hidden: "true", h(
    "path",
    d: profile-icons.at(name),
  ))
}

// The row of profile links under the name, from the landing page's `links:`,
// each `(name: .., icon: .., url: ..)`. The name is what a screen reader says
// and what the pointer's tooltip shows; the logo itself is decoration.
#let profile-links(links) = if links.len() > 0 {
  h("p", class: "profile-links", for link in links {
    h("a", href: link.url, aria-label: link.name, title: link.name, profile-icon(link.icon))
  })
}

#let site-header(page) = h("header", class: "site-header", {
  h("a", class: "skip", href: "#main", label(page, "skip", "Skip to content"))
  // The name, and under it the site's `description` from config: the same one
  // line the feed carries as its channel description. No description, no line.
  //
  // Beside them, on the landing page, its `image:`, the portrait the social card
  // draws too. It is a file beside `content/index.typ`, which baudelaire serves
  // under `/assets/` like every content file. Decorative: the name is next to it.
  //
  // On the landing page only: elsewhere the header is the name and nothing more.
  let home = pages(page.lang).find(p => p.url == "/")
  h("div", class: "masthead", {
    if page.url == "/" and home != none and home.image != none {
      h("img", class: "avatar", src: "/assets/" + home.image, alt: "", loading: "eager")
    }
    h("a", class: "brand", href: "/", site-title)
    if site-description not in (none, "") { h("p", class: "site-tagline", site-description) }
    if page.url == "/" { profile-links(page.frontmatter.at("links", default: ())) }
  })
  top-nav(page)
})

// `rss` -> `RSS`, `atom` -> `Atom`: the names these formats are written under,
// which are not one rule.
#let feed-name(format) = (rss: "RSS", atom: "Atom", json: "JSON").at(format, default: upper(format))

// The feeds the build actually wrote, in this page's language. Read from the
// site module rather than spelled here: which formats exist, what they are
// called, and where a translated site puts them are all config, and a link
// written by hand can name a file no pass produced.
#let feed-links(page) = {
  let links = feeds.map(feed => (feed, feed-url(feed, page.lang))).filter(pair => pair.at(1) != none)
  if links.len() > 0 {
    h("span", class: "feeds", for (feed, url) in links {
      h("a", href: url, feed-name(feed.format))
    })
  }
}

// One line: the name, the day the site was built, the feeds. The build date is
// the compile's own, so it moves with every deploy without anyone editing it.
#let site-footer(page) = h("footer", class: "site-footer", {
  let today = datetime.today()
  let parts = (
    "Copyright © " + if author not in (none, "") { author } else { site-title },
    {
      label(page, "last-updated", "last updated") + ": "
      h("time", datetime: today.display("[year]-[month]-[day]"), today.display("[year]-[month]-[day]"))
    },
    feed-links(page),
  ).filter(x => x != none)
  h("p", class: "footer-line", parts.join(h("span", class: "footer-sep", aria-hidden: "true", "·")))
})

// A date in both forms baudelaire hands over: the machine one for `datetime`,
// the localized one for the reader. Typst's own `display` knows English month
// names only, which is why the second is not derived here.
#let posted(date) = if date != none {
  h("time", class: "date", datetime: date.iso, date.display)
}

// Prev/next through the work, as one forward link: a case study ends by
// offering the next project rather than a symmetric pair of arrows.
#let next-project(page) = {
  let target = if page.nav.next != none { page.nav.next } else { page.nav.prev }
  if target != none {
    h("nav", class: "next-project", aria-label: label(page, "pagination", "Project navigation"), {
      h("a", href: target.url, {
        h("span", class: "next-label", label(page, "next-project", "Next project"))
        h("span", class: "next-title", {
          target.title
          arrow
        })
      })
    })
  }
}

// The document shell. typst-html owns `<html>`, `<head>` and `<body>`, so this
// emits none of them; the stylesheet link sits at the top of the body, which
// browsers accept and an `after` hook in `config.kdl` moves into the head.
#let shell(page, main) = {
  let title = page.frontmatter.at("title", default: site-title)
  set document(title: title)

  // No feed `<link rel="alternate">` here: baudelaire writes one per configured
  // format in the head already, with the base URL and this page's language on
  // it, and a second one written by hand can only be a wrong duplicate.
  h("link", rel: "stylesheet", href: "/assets/style.css")

  site-header(page)
  h("main", class: "content", id: "main", main)
  site-footer(page)
}

// The landing page's bio, the part of its body `home.typ` sets beside the
// news. Everything else in the body runs below the bio and news, full width.
// The bio rides in a labelled `metadata`, which renders nothing itself, so the
// template finds it among the body's children and places its value.
#let bio(body) = [#metadata(body)<bio>]

// A section heading with a link on the same line, pushed to the right: a
// landing-page selection and the way to everything it was selected from,
// `#section-head("Selected projects", link("/research/")[All projects →])`.
// The `id` is the one a plain `= heading` would get, so anchors keep working.
#let section-head(title, more) = h("div", class: "section-head", {
  h("h2", id: lower(title).replace(regex("[^\\p{L}\\p{N}]+"), "-").trim("-"), title)
  h("span", class: "section-more", more)
})

// A passage that starts folded behind its opening, `summary`, on a phone and
// unfolded on a wider screen, and folds or unfolds on a click on either. A
// `<details>` closed in the markup: the stylesheet sets the summary inline so
// the body runs on after it as one paragraph, and reads `open` the other way
// round past the narrow breakpoint, so no script has to set `open` from the
// viewport. The summary should read as the passage's first words. The body is
// a `<span>`, the box its fade-in plays on, so it should be one paragraph.
#let collapsible(summary, body) = h("details", class: "collapsible", {
  h("summary", summary)
  h("span", class: "collapsible-body", body)
})

// The pill links a research project opens with: the paper, its preprint, the
// slides, the poster, the code. Each is the icon from the old Zola shortcode of
// the same name, drawn inline so it inherits `currentColor` from the pill.
#let links-icon(url, text, ..children, viewBox: "0 0 512 512") = h("a", href: url, class: "links-icon", {
  h("svg", xmlns: "http://www.w3.org/2000/svg", viewBox: viewBox, aria-hidden: "true", ..children.pos())
  text
})

#let paper(url, conference) = links-icon(
  url,
  conference,
  h(
    "path",
    d: "M416 221.25V416a48 48 0 01-48 48H144a48 48 0 01-48-48V96a48 48 0 0148-48h98.75a32 32 0 0122.62 9.37l141.26 141.26a32 32 0 019.37 22.62z",
    fill: "none",
    stroke: "currentColor",
    stroke-linejoin: "round",
    stroke-width: "32",
  ),
  h(
    "path",
    d: "M256 56v120a32 32 0 0032 32h120M176 288h160M176 368h160",
    fill: "none",
    stroke: "currentColor",
    stroke-linecap: "round",
    stroke-linejoin: "round",
    stroke-width: "32",
  ),
)

// A report is a paper that went nowhere: the same page, named as such.
#let report(url) = paper(url, "report")
#let manuscript(url) = paper(url, "manuscript")

#let arxiv(url) = links-icon(url, "arXiv", viewBox: "0 0 17.732 24.269", h(
  "g",
  transform: "translate(-566.984 -271.548)",
  {
    h(
      "path",
      d: "M573.549,280.916l2.266,2.738,6.674-7.84c.353-.47.52-.717.353-1.117a1.218,1.218,0,0,0-1.061-.748h0a.953.953,0,0,0-.712.262Z",
      fill: "currentColor",
    )
    h(
      "path",
      d: "M579.525,282.225l-10.606-10.174a1.413,1.413,0,0,0-.834-.5,1.09,1.09,0,0,0-1.027.66c-.167.4-.047.681.319,1.206l8.44,10.242h0l-6.282,7.716a1.336,1.336,0,0,0-.323,1.3,1.114,1.114,0,0,0,1.04.69A.992.992,0,0,0,571,293l8.519-7.92A1.924,1.924,0,0,0,579.525,282.225Z",
      fill: "#b31b1b",
    )
    h(
      "path",
      d: "M584.32,293.912l-8.525-10.275,0,0L573.53,280.9l-1.389,1.254a2.063,2.063,0,0,0,0,2.965l10.812,10.419a.925.925,0,0,0,.742.282,1.039,1.039,0,0,0,.953-.667A1.261,1.261,0,0,0,584.32,293.912Z",
      fill: "currentColor",
    )
  },
))

#let slides(url) = links-icon(
  url,
  "slides",
  h(
    "rect",
    x: "64",
    y: "176",
    width: "384",
    height: "256",
    rx: "28.87",
    ry: "28.87",
    fill: "none",
    stroke: "currentColor",
    stroke-linejoin: "round",
    stroke-width: "32",
  ),
  h(
    "path",
    d: "M144 80h224M112 128h288",
    stroke: "currentColor",
    stroke-linecap: "round",
    stroke-miterlimit: "10",
    stroke-width: "32",
  ),
)

#let poster(url) = links-icon(
  url,
  "poster",
  h(
    "rect",
    x: "48",
    y: "80",
    width: "416",
    height: "272",
    rx: "32",
    ry: "32",
    fill: "none",
    stroke: "currentColor",
    stroke-linejoin: "round",
    stroke-width: "32",
  ),
  h(
    "path",
    d: "M256 416v-64M256 80V48M400 464l-32-112M112 464l32-112",
    fill: "none",
    stroke: "currentColor",
    stroke-linecap: "round",
    stroke-linejoin: "round",
    stroke-width: "32",
  ),
)

#let code(url) = links-icon(url, "code", h(
  "path",
  d: "M160 368L32 256l128-112M352 368l128-112-128-112M304 96l-96 320",
  fill: "none",
  stroke: "currentColor",
  stroke-linecap: "round",
  stroke-linejoin: "round",
  stroke-width: "32",
))

#let video(url) = links-icon(
  url,
  "video",
  h(
    "path",
    d: "M374.79 308.78L457.5 367a16 16 0 0022.5-14.62V159.62A16 16 0 00457.5 145l-82.71 58.22A16 16 0 00368 216.3v79.4a16 16 0 006.79 13.08z",
    fill: "none",
    stroke: "currentColor",
    stroke-linecap: "round",
    stroke-linejoin: "round",
    stroke-width: "32",
  ),
  h(
    "path",
    d: "M268 384H84a52.15 52.15 0 01-52-52V180a52.15 52.15 0 0152-52h184.48A51.68 51.68 0 01320 179.52V332a52.15 52.15 0 01-52 52z",
    fill: "none",
    stroke: "currentColor",
    stroke-miterlimit: "10",
    stroke-width: "32",
  ),
)

#let scholar(url) = links-icon(url, "scholar", viewBox: "0 0 24 24", h(
  "path",
  d: profile-icons.scholar,
  fill: "currentColor",
))

// A title as a Google Scholar query, quoted so Scholar matches the phrase. Only
// the characters that would end or split a query string are escaped: a browser
// encodes the rest itself.
#let scholar-search(title) = {
  let escaped = (
    ("%", "%25"),
    ("&", "%26"),
    ("+", "%2B"),
    ("#", "%23"),
    ("?", "%3F"),
    ("\"", "%22"),
    (" ", "+"),
  ).fold(title, (s, pair) => s.replace(pair.at(0), pair.at(1)))
  "https://scholar.google.com/scholar?q=%22" + escaped + "%22"
}

// The work's links, from its frontmatter `links:`, in the order a reader
// reaches for them. Each is a URL, or a file beside the page; `paper` is
// `(url: .., venue: ..)`, the venue being the pill's text, or an array of
// them for a work published more than once.
//
// The Scholar pill is `links.scholar` when given, and otherwise a search for the
// title, for any work that is a paper: one with authors or a paper link.
//
// `lead`, when given, is set first, before the pills, such as the date on a
// project's own page.
#let work-links(entry, resolve, class: "work-links", lead: none) = {
  let extra = entry.at("extra", default: (:))
  let links = extra.at("links", default: (:))
  let pills = ()
  let paper-link = links.at("paper", default: none)
  let paper-links = if paper-link == none { () } else if type(paper-link) == array { paper-link } else { (paper-link,) }
  for paper-link in paper-links {
    let (url, venue) = if type(paper-link) == str { (paper-link, "paper") } else {
      (paper-link.url, paper-link.at("venue", default: "paper"))
    }
    pills.push(paper(resolve(url), venue))
  }
  for (key, pill) in (manuscript: manuscript, report: report, arxiv: arxiv, slides: slides, poster: poster, video: video, code: code) {
    let url = links.at(key, default: none)
    if url != none { pills.push(pill(resolve(url))) }
  }
  let is-paper = extra.at("paper_authors", default: ()).len() > 0 or paper-link != none
  let scholar-url = links.at("scholar", default: if is-paper { scholar-search(entry.label) })
  if scholar-url != none { pills.push(scholar(scholar-url)) }
  if lead != none { pills.insert(0, lead) }
  if pills.len() > 0 { h("span", class: class, pills.join()) }
}

// One work, as a row: its picture on the left with the year on it, then the
// title with its links beside it, the authors and the summary, stacked. Reads the row shape a listing
// entry and the page catalogue share, so the same call renders the landing
// page's selection, the `/research/` index, and a `stack` term page.
//
// The picture is `image:` from the work's own frontmatter, which is also the
// one the social card names. The authors are `paper_authors:`, each
// `(name: .., url: ..)`; the site's own author is set apart from the others.
//
// A row only knows its URL, not the folder it was written in, so a file named
// relative to the work (`slides.pdf`) is looked up under `/assets/` at the
// work's URL: keep a work's folder named as its URL slug.
#let work-card(page, entry) = {
  let extra = entry.at("extra", default: (:))
  let resolve(path) = if path.contains("://") or path.starts-with("/") or path.starts-with("mailto:") {
    path
  } else {
    "/assets" + entry.url + path
  }
  // The year alone, off the ISO date rather than the localized one, and the
  // venue the (first) paper pill names without its year: `ICML25` -> `ICML`.
  let year = if entry.date != none { entry.date.slice(0, count: 4) }
  let paper-link = extra.at("links", default: (:)).at("paper", default: none)
  if type(paper-link) == array { paper-link = paper-link.at(0, default: none) }
  let venue = if type(paper-link) == dictionary and paper-link.at("venue", default: none) != none {
    paper-link.venue.replace(regex("[\\s'’-]*\\d+$"), "")
  }
  h("li", class: "work-row", {
    // The picture, with a bar across its top: the year, and the venue when
    // the work is a paper. A work without a picture still gets the frame, so
    // the bar has somewhere to sit and the rows line up.
    h("a", class: "work-cover", href: entry.url, tabindex: "-1", aria-hidden: "true", {
      if entry.image != none { h("img", src: resolve(entry.image), alt: "", loading: "lazy") }
      if year != none or venue != none {
        h("span", class: "work-year", (year, venue).filter(x => x != none).join(" · "))
      }
    })
    h("div", class: "work-body", {
      h("p", class: "work-head", {
        h("a", class: "work-title", href: entry.url, {
          // The year and venue again, as text, shown only where the
          // stylesheet hides the picture they otherwise sit on.
          if year != none or venue != none {
            h("span", class: "work-year-inline", aria-hidden: "true", (year, venue).filter(x => x != none).join(" · ") + " ·")
          }
          entry.label
        })
        work-links(entry, resolve)
      })
      let authors = extra.at("paper_authors", default: ())
      if authors.len() > 0 {
        h("p", class: "work-authors", authors
          .map(a => {
            let me = author not in (none, "") and a.name.trim("*") == author
            let name = if a.at("url", default: none) != none { h("a", href: a.url, a.name) } else { a.name }
            if me { h("span", class: "work-me", name) } else { name }
          })
          .join(", "))
      }
      if entry.description != none { h("p", class: "work-summary", entry.description) }
      let terms = entry.taxonomies.at("stack", default: ())
      if terms.len() > 0 {
        h("p", class: "work-stack", for term in terms {
          h("a", class: "chip", href: "/stack/" + term + "/", term)
        })
      }
    })
  })
}

// The rows, in a list. With `timeline: true`, they are grouped by year, a
// column of years runs beside them, newest first, and each year links to its
// group, whose id is `year-<year>`.
#let work-grid(page, entries, timeline: false) = {
  let year(entry) = if entry.date != none { entry.date.slice(0, count: 4) } else { "" }
  let years = entries.map(year).dedup()
  if not timeline or years.filter(y => y != "").len() == 0 {
    return h("ul", class: "work-list", for entry in entries { work-card(page, entry) })
  }

  h("div", class: "work-timeline", {
    h("nav", class: "year-nav", aria-label: label(page, "years", "Years"), h("ol", for y in years.filter(y => y != "") {
      h("li", h("a", href: "#year-" + y, y))
    }))
    h("div", class: "work-years", for y in years {
      h("section", class: "work-year-group", id: if y != "" { "year-" + y }, h("ul", class: "work-list", for entry in entries.filter(e => year(e) == y) {
        work-card(page, entry)
      }))
    })
  })

  // Lights the year being read, in CSS alone: CSS cannot pair a link with its
  // group by itself, so this names them, one rule per year.
  //
  // Where scroll-driven animations exist, each group is a view timeline and
  // its link is lit while the group crosses a line near the top of the window
  // (the animation is in `style.css`). Elsewhere, the link of the group last
  // jumped to is lit, or the newest year before any jump.
  let ys = years.filter(y => y != "")
  let link(y) = ".year-nav a[href=\"#year-" + y + "\"]"
  let targeted = (
    (".work-timeline:not(:has(:target)) .year-nav li:first-child a",)
      + ys.map(y => ".work-timeline:has(#year-" + y + ":target) " + link(y))
  )
  h("style", {
    "@supports not (animation-timeline: view()) {\n"
    targeted.join(",\n") + " { color: var(--accent); font-weight: 650; }\n"
    targeted.map(sel => sel + "::before").join(",\n") + " { border-color: var(--accent); background: var(--accent); }\n"
    "}\n"
    "@supports (animation-timeline: view()) {\n"
    ".work-timeline { timeline-scope: " + ys.map(y => "--year-" + y).join(", ") + "; }\n"
    for y in ys {
      "#year-" + y + " { view-timeline-name: --year-" + y + "; }\n"
      link(y) + ", " + link(y) + "::before { animation-timeline: --year-" + y + "; }\n"
    }
    "}"
  })
}
