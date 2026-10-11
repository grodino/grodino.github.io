#let frontmatter = (
  title: "Manipulation-Proof Oblivious Audits against Deceptive Model Providers",
  date: datetime(year: 2026, month: 10, day: 1),
  image: "patching.svg",
  alt: "A provider patching a known audit set versus a hidden one",
  description: "Hide the audit set in a much larger one, and providers can no longer patch only what you audit.",
  paper_authors: (
    (
      name: "Augustin Godinot",
      url: "https://godinot.xyz/",
      affiliation: "Inria, Université de Rennes",
    ),
    (name: "Sofiane Azogagh", url: "https://sofianeazogagh.github.io/", affiliation: "EURECOM"),
    (name: "Julien Ferry", url: "https://ferryjul.github.io/", affiliation: "Polytechnique Montréal"),
    (name: "Sébastien Gambs", url: "https://sebastiengambs.openum.ca/", affiliation: "Université du Québec à Montréal"),
  ),
  links: (
    paper: (url: "https://arxiv.org/abs/2608.04365", venue: "AIES26"),
    poster: "poster.pdf",
    code: "https://github.com/sofianeazogagh/oblivious_audit",
  ),
)

#figure(
  placement: auto,
  // scope: "parent",
  image(width: 100%, "patching.svg", alt: "A provider patching a known audit set versus a hidden one"),
  caption: [When the provider knows the audit set $S$, one flip suffices. When $S$ is hidden in $C$,
    it must fix all of $C$, and is twice as likely to hit a canary 🐦.],
)
Under the DSA, regulators can audit the AI systems of large platforms. But the platform knows when it
is audited, and on which questions. Showing one model to the regulator and another one to the users
is then very easy: to hide unfairness, flipping a handful of answers on the audit set is enough. Hiding
a demographic parity gap of 0.01 on 400 balanced queries takes *2 flips*. This is the same
manipulation problem as in our #link("/research/005-manipulated-audits/")[SaTML24] and
#link("/research/007-audit-with-prior/")[ICML25] papers, but this time, we tackle the problem with a different approach.

Existing defenses either
- 👀 look at the model differently (research APIs, monitoring, sock puppets), but still trust the
  provider;
- 📚 bring external information (labeled data, priors, see our
  #link("/research/007-audit-with-prior/")[ICML25 paper]), which is expensive for the auditor;
- 🔒 verify every inference (zero-knowledge proofs, MPC, secure hardware), which is expensive for the
  provider and does not work for every model.

#figure(
  placement: auto,
  image("detection.svg", alt: "Probability of detecting the manipulation versus the number of canaries"),
  caption: [Probability of catching a platform hiding half of its unfairness, for R²esPIR (blue) and
    a vanilla audit (grey).],
)
In this paper, we mix canaries with lightweight cryptography. The intuition: faking fairness on a few
known inputs is easy, faking it on a large set of inputs without getting caught is much harder.
+ You, the platform 😈, label a large candidate set and commit to your answers.
+ I, the auditor 🕵️, secretly read the answers of a small audit set with
  #link("https://en.wikipedia.org/wiki/Private_information_retrieval")[Private Information Retrieval]:
  you never learn which ones.
+ Among them are a few canaries 🐦, whose honest answers I got from your public service. If an answer
  differs, you are caught.

Not knowing what is audited, the platform has to fix the whole candidate set. On our datasets, it
must flip about 4× more answers, which roughly doubles its chances of getting caught. And this costs
28 ms per query, without touching the model.


Want to know more? Have a look at the #link("https://arxiv.org/abs/2608.04365")[paper], the
#link("poster.pdf")[poster] or the #link("https://github.com/sofianeazogagh/oblivious_audit")[code].
