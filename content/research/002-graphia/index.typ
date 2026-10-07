#let frontmatter = (
  title: "graphia",
  date: datetime(year: 2020, month: 5, day: 22),
  image: "cover.png",
  alt: "Inter-contact histogram of the Infocom06 dataset",
  description: "Practical analysis of dynamical networks. Development of an analysis tool in Rust.",
  links: (
    report: "IA_ML_Models_for_real_mobile_networks.pdf",
    code: "https://github.com/grodino/graphia",
  ),
)

Existing complex networks share well known structural properties that can be captured by models: Erdos-Renyi, small-world, scale-free ...

However, these models only describe networks at a given time.
The objective of this project was to study and implement models for dynamical networks.
For this, I created a tool in Rust : #link("https://github.com/grodino/graphia/")[`graphia`].

The report can be found #link("/assets/research/002-graphia/IA_ML_Models_for_real_mobile_networks.pdf")[here], along with the #link("https://github.com/grodino/graphia/")[code].
