// The news page: the pieces at the full width of the page, without a title.
// The page's frontmatter title still names it in the tab and the nav.

#import "@baudelaire/html:0.1.0": h
#import "../parts.typ": shell

#let news(page, body) = shell(page, h("article", class: "prose news-page", body))
