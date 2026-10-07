#import "@baudelaire/html:0.1.0": h

#let frontmatter = (
  title: "News",
  template: "news.typ",
)

#let news = (
  (
    date: datetime(year: 2025, month: 5, day: 1),
    title: "Our formalization of auditing with a prior has been accepted at ICML25!",
    project: "/research/007-audit-with-prior/",
    body: [
      Learn more on the project #link("/research/007-audit-with-prior/")[page] or the #link("https://arxiv.org/abs/2505.04796")[arXiv].
    ],
  ),
  (
    date: datetime(year: 2025, month: 3, day: 11),
    title: "An ARTISHAU in Toronto.",
    body: [
      Just arrived in Toronto where I will be a Visiting PhD Student in the #link("https://cleverhans.io/")[CleverHans] lab for six months.
      Exited to work on user audits with #link("https://m-yaghini.github.io/")[Mohammad] and #link("https://www.papernot.fr/")[Nicolas], and to enjoy Toronto!
    ],
  ),
  (
    date: datetime(year: 2025, month: 2, day: 1),
    title: "AAAI25, let's talk about model fingerprinting.",
    project: "/research/006-qurd/",
    body: [
      What started as a simple project on model distances became a full-fledged analysis of the model fingerprinting problem and its evaluation.
      #link("https://arxiv.org/abs/2412.13021")[ArXiv], #link("https://github.com/grodino/QuRD")[code], #link("/assets/research/006-qurd/poster.pdf")[poster]
    ],
  ),
  (
    date: datetime(year: 2024, month: 2, day: 1),
    title: "SaTML 2024: Under manipulations, are there models harder to audit?",
    project: "/research/005-manipulated-audits/",
    body: [
      Our results on the auditability of large models in the presence of platform manipulation have been accepted to SaTML 2024!
      #link("https://openreview.net/forum?id=Q40m3Gcsd9")[paper], #link("https://arxiv.org/abs/2402.09043")[ArXiv], #link("/research/005-manipulated-audits/")[project]
    ],
  ),
  (
    date: datetime(year: 2023, month: 12, day: 7),
    title: "WIDE @ EPFL",
    project: "/research/005-manipulated-audits/",
    body: [
      I will be presenting our results on the auditability of large models in the presence of platform manipulation to the #link("https://www.epfl.ch/schools/ic/")[IC school] at EPFL on Dec. 9th at 11AM.
      #link("/assets/research/005-manipulated-audits/slides.pdf")[slides], #link("/assets/research/005-manipulated-audits/poster.pdf")[poster]
    ],
  ),
  (
    date: datetime(year: 2023, month: 7, day: 7),
    title: "PFIA 2023: Change-Relaxed Active Fairness Auditing",
    project: "/research/005-manipulated-audits/",
    body: [
      I will be presenting an early version of our work on the black-box auditability of ML models at #link("https://pfia23.icube.unistra.fr/")[PFIA].
      You can find the paper #link("https://pfia23.icube.unistra.fr/conferences/rjcia/Actes/RJCIA2023_paper_10.pdf")[here], more to come on that subject!
    ],
  ),
  (
    date: datetime(year: 2023, month: 1, day: 25),
    title: "Journal publication of the reworked CNA 2021 study",
    project: "/research/003-recodiv/",
    body: [
      Our #link("https://doi.org/10.1007/s41109-022-00530-7")[work] on the effect of collaborative filtering on the diversity of users' exposure has been accepted for publication in #link("https://appliednetsci.springeropen.com/")[Applied Network Science]!
      More info #link("/research/003-recodiv/")[here].
    ],
  ),
  (
    date: datetime(year: 2022, month: 11, day: 30),
    title: "🥈 2nd place at PeREN hackathon with Jade!",
    body: [
      The #link("https://www.peren.gouv.fr/actualites/2022-11-30_conferences_et_hackathon_2022/")[« Segmente moi si tu peux ! »] hackathon, was organized by the #link("https://www.peren.gouv.fr/en")[PeREN].
      The goal was to detect the type of pricing algorithm behind a delivery app by generating black-box queries to the app.
      We reached the second place, together with Jade Garcia-Bourrée and were awarded our price by the French Minister for Digital Transition and Telecommunications Jean-Noël Barrot.
    ],
  ),
  (
    date: datetime(year: 2022, month: 11, day: 1),
    title: "Off to Rennes!",
    body: [
      I am starting my PhD on "Auditing the mutations of online AI models" at #link("https://team.inria.fr/wide/")[WIDE]!
    ],
  ),
  (
    date: datetime(year: 2022, month: 4, day: 4),
    title: "NLE internship",
    body: [
      Grenoble, here I come!
      Starting my masters final internship at NaverLabs Europe with Jean-Michel Renders on _Diversity in Search and Recommendation systems_.
    ],
  ),
  (
    date: datetime(year: 2021, month: 11, day: 30),
    title: "CNA 2021",
    project: "/research/003-recodiv/",
    body: [
      I will be presenting our work "_Recommender systems increase exposure diversity. Or do they? A complex networks approach._, Augustin Godinot, Fabien Tarissan" at the #link("https://complexnetworks.org/")[Complex Networks and their Applications] conference!
      Slides and info #link("/research/003-recodiv/")[here].
    ],
  ),
  (
    date: datetime(year: 2021, month: 5, day: 2),
    title: "Submitted our article to RecSys!",
    project: "/research/003-recodiv/",
    body: [
      We submitted our _Measuring the effect of collaborative filtering on the diversity of users' attention_ article together with #link("https://www-complexnetworks.lip6.fr/~tarissan/")[Fabien]!
    ],
  ),
  (
    date: datetime(year: 2020, month: 9, day: 1),
    title: "Created this website!",
  ),
)

// One piece of news per entry, newest first. A list rather than calls to
// `entry`, so the landing page can import it (`#import "news.typ": news`) and
// show the latest few without a second copy to keep in step.

// The id the build gives each piece's heading, which the landing page links
// to: the title in lower case, each run of other characters a single `-`.
// A piece with a `project` (the path of a project page) links there instead.
#let anchor(title) = lower(title).replace(regex("[^\p{L}\p{N}]+"), "-").trim("-")

// Each piece on a timeline: its date in the left column, beside the line,
// and its heading and text to the right.
#let entry(date: none, title: none, project: none, body: none) = h("div", class: "news-entry", {
  h("time", datetime: date.display("[year]-[month]-[day]"), date.display("[month repr:long] [year]"))
  h("div", class: "news-entry-body", {
    [= #title]
    body
  })
})

#for item in news { entry(..item) }
