# paysage

A portfolio. A landing page that says what you do, a grid of work that builds
itself from the projects you publish, and case studies with room for pictures.

```kdl
theme "themes/paysage"
```

## What you get

- `home.typ` — the landing page: your bio beside the news, then the rest of the
  page. Bind it with
  `template: "home.typ"`.
- `project.typ` — one case study: title, a fact row (date, role, client,
  duration, stack), a cover image, the write-up, and a link to the next project.
- `page.typ` — an ordinary page: about, contact, colophon.
- `list.typ` — the `/work/` index and the `stack` term pages, as the same grid.
- `not-found.typ` — the page a host serves for an unmatched URL. Bind it from
  `content/404.typ`, which publishes as a flat `404.html`.
- A `work` collection over `content/work/`, newest first, a `stack` taxonomy,
  RSS, and a sitemap.

## A project

```typ
#let frontmatter = (
  title: "Ledger",
  date: datetime(year: 2026, month: 3, day: 1),
  summary: "A double-entry bookkeeping engine that a spreadsheet can read.",
  image: "/static/work/ledger.jpg",
  alt: "The ledger's reconciliation view.",
  role: "Design and build",
  client: "Self-directed",
  duration: "4 months",
  stack: ("rust", "sqlite"),
)

= What it does
...
```

| Frontmatter | Effect |
|---|---|
| `summary` | the line under the title, and under the card in the grid |
| `image`, `alt` | the card image, the page's own cover, and the social card |
| `date` | ordering, the year on the card, the fact row |
| `role`, `client`, `duration` | the fact row, each shown only if set |
| `stack` | chips on the card and the page, term pages under `/stack/` |

## The landing page

```typ
#let frontmatter = (
  title: "I build tools for people who read numbers.",
  template: "home.typ",
  tagline: "Systems engineer, occasionally a designer.",
  links: (
    (name: "GitHub", icon: "github", url: "https://github.com/you"),
    (name: "Email", icon: "email", url: "mailto:you@example.com"),
  ),
  news: "/content/news.typ",
)
```

`links` is the row of logos under the name, on the landing page only; `icon`
is a key of `profile-icons` in `parts.typ` (`scholar`, `github`, `bluesky`,
`linkedin`) or `email`. `news` names a file that exports a `news` list of
`(date:, title:, body:, project:)`, newest first (`project`, optional, is the
path of a page the piece links to from the landing page instead of the news
page): the latest is shown in full beside the
bio, the next three one line each, then `All news →`. It is a path rather than
the list itself because frontmatter goes into the page catalogue, which cannot
hold content.

The body's `bio[...]` (from `parts.typ`) is the bio beside the news; the rest of
the body runs below them, full width. A selection of projects is written there
with `work-grid` over the `@baudelaire/pages` catalogue. A body with no `bio`
is all bio.

The top nav needs no menu in config: content directories come from
`@baudelaire/sections` and the pages beside your landing page come from the page
catalogue, so an `about.typ` appears by existing.

## Images

`image` is a URL, not a Typst `image()`: it is used as an `<img src>` on the
card and on the page. Put the files under `static/` (copied verbatim) or
`assets/` (processed, and then referenced by their built path).

It is baudelaire's own `image` field rather than a `cover` of this theme's
invention, so the same line also names the `og:image` a link preview shows.

## Translating it

Every visible word comes from the site's string table:

```kdl
languages {
  fr {
    strings {
      next-project "Projet suivant"
      role "Rôle"
      stack "Outils"
    }
  }
}
```

Keys used: `skip`, `primary`, `news`, `all-news`, `next-project`,
`date`, `role`, `client`, `duration`, `stack`, `pagination`, `newer`, `older`,
`home`.

## Overriding it

Copy any file into your own tree at the same relative path and yours wins. For a
recolour, restate the custom properties at the top of `style.css`: `--accent`
(links, hover, code), `--bg`, `--raised` (cards), `--fg`, `--muted`, `--rule`,
and the widths `--measure` and `--wide`.
