#let frontmatter = (
  title: "Robust ML Auditing using Prior Knowledge",
  date: datetime(year: 2025, month: 5, day: 1),
  image: "game.png",
  alt: "Interactions between the platform, the auditor and the users",
  description: "How can auditors use prior knowledge to improve the robustness of their audit?",
  paper_authors: (
    (
      name: "Jade Garcia Bourrée*",
      url: "https://jadegarciabourree.github.io/",
      affiliation: "Inria, Université de Rennes",
    ),
    (
      name: "Augustin Godinot*",
      url: "https://grodino.github.io",
      affiliation: "Université de Rennes, Inria, IRISA/CNRS, PEReN",
    ),
    (name: "Martijn de Vos", url: "https://devos50.github.io/", affiliation: "EPFL"),
    (name: "Milos Vujasinovic", url: "https://mvujas.com/", affiliation: "EPFL"),
    (name: "Sayan Biswas", url: "https://blitzwas.github.io/", affiliation: "EPFL"),
    (name: "Gilles Tredan", url: "https://homepages.laas.fr/gtredan/", affiliation: "LAAS, CNRS"),
    (name: "Erwan Le Merrer", url: "https://erwanlemerrer.github.io/", affiliation: "Inria"),
    (name: "Anne-Marie Kermarrec", url: "https://people.epfl.ch/anne-marie.kermarrec", affiliation: "EPFL"),
  ),
  links: (
    paper: (url: "https://openreview.net/forum?id=AiaVCVDuxF", venue: "ICML25"),
    arxiv: "https://arxiv.org/abs/2505.04796",
    poster: "poster.pdf",
    code: "https://github.com/grodino/merlin",
  ),
)

Do you remember Dieselgate? The car computer would detect when it was on a test-bench and reduce the
engine power to fake environmental compliance. Well, this can happen with AI regulation too.

#figure(
  placement: auto,
  image("game.png", alt: "Interactions between the platform, the auditor and the users", width: 25em),
  caption: [Interactions between the platform, the auditor and the users],
)
An audit is pretty straightforward.
+ I, the auditor 🕵️ come up with questions to ask your model.
+ You, the platform 😈 answer my questions.
+ I look at your answers and decide whether your system abides by the law by computing a series of
  aggregate metrics.


Now, you know the metric, you know the questions, and I don't have access to your model.
Thus, nothing prevents you from manipulating the answers of your model to pass the audit.
And this is very easy! In fact, *any fairness mitigation method can be transformed into an audit
manipulation attack.*

There are two main approaches to avoid manipulations.
- 🔒Crypto guarantees: the model provider is forced to commit their model and sign every answer.
- 📐Clever ML tricks: the auditor uses information about the model (training data, model structure,
  ...) to understand what is a "good answer".

In this paper, we formalize the second approach as a search for efficient "audit priors".
We instantiate our framework with a simple idea: just look at the accuracy of the platform's answers.
Our experiments show that this can help reduce the amount of unfairness a platform could hide.

#figure(
  placement: auto,
  scope: "parent",
  image(
    "concealable_unfairness.png",
    width: 80%,
    alt: "The amount of unfairness a platform can hide as a function of the auditor query budget",
  ),
  caption: [The concealable unfairness for different audit budgets (_i.e._, data samples from the
    labeled dataset). We highlight this for two features of the CelebA dataset (left) and for two
    different ML models trained on the ACSEmployment dataset (right).],
)

If you want to read more about this, I encourage you to read the
#link("https://arxiv.org/abs/2505.04796")[paper], but not only! Recently, there has been a lot of exciting
works on robust audits, here are a few I enjoyed:
- #link("https://arxiv.org/abs/2402.02675")[Verifiable evaluations of machine learning models using zkSNARKs]
- #link("https://arxiv.org/abs/2504.00874")[P2NIA: Privacy-Preserving Non-Iterative Auditing]
- #link("https://arxiv.org/abs/2502.03773")[ExpProof : Operationalizing Explanations for Confidential Models with ZKPs]
- #link("https://arxiv.org/abs/2305.13883")[On the relevance of APIs facing fairwashed audits]
- #link(
    "https://arxiv.org/abs/2410.02777",
  )[OATH: Efficient and Flexible Zero-Knowledge Proofs of End-to-End ML Fairness]
