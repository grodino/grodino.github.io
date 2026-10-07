#import "@baudelaire/pages:0.1.0": pages
#import "/themes/academic/parts.typ": bio, collapsible, work-grid

#let frontmatter = (
  template: "home.typ",
  image: "portrait.jpg",
  alt: "Portrait of Augustin Godinot",
  // The icon row under the name. `icon` names one of the theme's
  // `profile-icons`.
  links: (
    (name: "Google Scholar", icon: "scholar", url: "https://scholar.google.com/citations?user=LKAxA34AAAAJ"),
    (name: "GitHub", icon: "github", url: "https://github.com/grodino"),
    (name: "Bluesky", icon: "bluesky", url: "https://bsky.app/profile/grodino.bsky.social"),
    (name: "LinkedIn", icon: "linkedin", url: "https://www.linkedin.com/in/augustingodinot/"),
    (name: "Email", icon: "email", url: "mailto:agodinot@mpi-sws.org"),
  ),
  // The column beside the bio, the latest pieces of news, read from the
  // `news` list this file exports.
  news: "/content/news.typ",
)


#bio[
  I am a postdoctoral researcher at the Max Planck Institute for Software Systems (#link("https://www.mpi-sws.org/")[MPI-SWS]) in #link("https://people.mpi-sws.org/~manuelgr/index.html")[Manuel Gomez Rodriguez]'s group.
  I am interested in the computational interactions between players of the AI ecosystem (providers, users, non-users, regulators, governments...) and how to design them such that providers serve users instead of the contrary.
  If that sounds interesting to you, feel free to reach out, I am always looking to chat about new ideas!

  #collapsible[Prior to that][
    , I obtained my PhD from #link("https://team.inria.fr/artishau/")[INRIA] in 2026, jointly with #link("https://www.irisa.fr/")[IRISA/CNRS] and #link("https://www.peren.gouv.fr/en/")[PEReN].
    I was fortunate to have no less than four (4) advisors: #link("https://homepages.laas.fr/gtredan/")[Gilles Trédan], #link("https://erwanlemerrer.github.io/")[Erwan Le Merrer], #link("https://ftaiani.ouvaton.org/")[François Taïani] and #link("https://www.linkedin.com/in/camilla-penzo-a2711010a/")[Camilla Penzo] (then #link("https://www.peren.gouv.fr/fr/equipe/gohar-dashyan/")[Gohar Dashyan]).
    I developed methods and impossibility results for AI audits in the presence of malicious providers.
    During that time, I worked with #link("https://www.papernot.fr/")[Nicolas Papernot] and #link("https://m-yaghini.github.io/")[Mohammad Yaghini] as part of a six months research visit at the #link("https://www.utoronto.ca/")[University of Toronto], and collaborated with #link("https://www.peren.gouv.fr/en/")[PEReN] on content diversity measurement in French media.
    I hold a Bachelor and Master's degree from #link("https://ens-paris-saclay.fr/")[ENS Paris-Saclay], during which I was a civil servant for four years.

    *CV*: #link("/assets/CV/short.pdf")[short] (updated 03-2026), #link("/assets/CV/long.pdf")[long] (updated 12-2025)
  ]
]

= Selected projects
#link("/research/")[All projects →]


// The latest three, newest first. The catalogue is empty on the build's first
// pass, hence the `calc.min`.
#let projects = pages("en").filter(p => p.collection == "research")
#work-grid(none, projects.slice(calc.min(1, projects.len()), calc.min(4, projects.len())))


= Service
