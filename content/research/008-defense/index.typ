#let frontmatter = (
  title: "PhD Defense",
  date: datetime(year: 2026, month: 2, day: 10),
  image: "manuscript-cover.png",
  alt: "Manuscript cover",
  description: "Thinking Out of the (Black)-Box: Tools for machine learning audits in the presence of deceptive model providers",
  links: (
    manuscript: "manuscript-Augustin_Godinot-DRAFT.pdf",
    slides: "Defense Slides.pdf",
  ),
)

= Thinking Out of the (Black)-Box: Tools for machine learning audits in the presence of deceptive model providers

#image("manuscript-cover.svg", alt: "Manuscript cover")

=== PhD defense
Tuesday, *February 10th 2026 at 14:30*, I will be defending my thesis in Salle Aurigny at #link("https://www.inria.fr/en/how-reach-inria-centre-rennes-university")[INRIA Centre de l'Université de Rennes].

#link("Augustin Godinot's PhD defense.ics")[Add to calendar (.ics)]

=== Manuscript/slides
Reviewed #link("manuscript-Augustin_Godinot-DRAFT.pdf")[draft] before the defense. Final version to come.
#link("Defense Slides.pdf")[Defense slides].

= Abstract
Machine learning-based prediction services are now widely deployed across industries by companies, governments, and individuals.
Yet, these services often rely on a complex AI supply chain, whose components (training data, models, infrastructure), while critical to their performance, are partially or completely hidden to the final users.
Thus, to an external user or regulator, these prediction services appear as black-boxes, complicating their evaluation and opening avenues for manipulations.
In the presence of deceptive model providers, this thesis aims to understand the fundamental limits to black-box auditing and designing protocols to provide guarantees beyond the black-box interaction model.
This manuscript presents three contributions towards that goal.
First, I present a formalization of this quest for the minimal assumption beyond the black-box as a prior construction problem and provide a new audit method leveraging the labeled data available to the auditor.
Then, I study the benefits of requesting the hypothesis class used by the platform to inform the audit.
Finally, in an attempt to cheaply detect post-audit attacks, I introduce a new model fingerprint baseline and theoretical analysis to detect model change.

= Jury
- Mme. #link("https://people.rennes.inria.fr/Aline.Roumy/")[Aline ROUMY], _Directrice~de~Recherche~\@~INRIA_ — Présidente
- M. #link("https://sites.google.com/view/damien-garreau/home")[Damien GAREAU], _Professor~\@~University~of~Würzburg_ — Rapporteur
- M. #link("https://researchers.lille.inria.fr/abellet/")[Aurélien BELLET], _Directeur~de~Recherche~\@~INRIA_ — Rapporteur
- M. #link("https://www.papernot.fr/")[Nicolas PAPERNOT], _Assistant~Professor~\@~University~of~Toronto_ — Examinateur
- M. #link("https://homepages.laas.fr/gtredan/")[Gilles TRÉDAN], _Directeur~de~Recherche~\@~LAAS-CNRS_ — Directeur de thèse
- M. #link("https://erwanlemerrer.github.io/")[Erwan LE MERRER], _Chercheur~\@~INRIA_ — Directeur de thèse
- M. #link("https://team.inria.fr/wide/team/francois-taiani/")[François TAÏANI], _Professeur~des~Universités~\@~Université~de~Rennes_ — Directeur de thèse
- Mme. #link("https://www.peren.gouv.fr/en/recherche-equipe/gohar-dashyan/")[Gohar DASHYAN], _Lead~Recherche~et~Éthique~\@~PEReN_ — Encadrante
