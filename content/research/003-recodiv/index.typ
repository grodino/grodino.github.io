#let frontmatter = (
  title: "Exposure diversity in music recommender systems",
  date: datetime(year: 2021, month: 1, day: 28),
  image: "cover.png",
  alt: "The facets of diversity: variety, balance and disparity",
  description: "Study of exposure diversity through the lens of an Heterogeneous Networks diversity measure.",
  links: (
    paper: (
      (url: "recodiv_CNA.pdf", venue: "CNA21"),
      (url: "https://doi.org/10.1007/s41109-022-00530-7", venue: "journal"),
    ),
    slides: "slides_CNA_2021.pdf",
    code: "https://github.com/grodino/recodiv",
  ),
)

During this five month project with #link("https://www-complexnetworks.lip6.fr/~tarissan/")[Fabien Tarissan], I studied the diversity of the recommendations made by music recommender systems.
We built upon a #link("https://arxiv.org/abs/2001.01296")[diversity measure in heterogeneous networks] and applied it to study the algorithm from #link("https://ieeexplore.ieee.org/document/4781121")[Collaborative Filtering For Implicit Datasets].

*UPDATE*: The extended version of our work was accepted in #link("https://appliednetsci.springeropen.com/")[Applied Network Science]
- Paper : #link("https://doi.org/10.1007/s41109-022-00530-7")[pdf]

*UPDATE*: I presented our work at the #link("https://complexnetworks.org/")[CNA 2021] conference in Madrid. Here is the related material:
- Extended abstract: #link("recodiv_CNA.pdf")[pdf]
- Presentation slides: #link("slides_CNA_2021.pdf")[pdf]

*Are the music recommendations locking you in a particular genre ?*

Usually, recommendations are known to expose users to a greater diversity of items than what they would have searched themselves.
However, the studies which came to such results only considered one aspect of diversity, namely the _variety_ of reached categories.

With our new approach, we were able to show that despite increasing exposure _variety_ for all users, *recommendations significanlty reduce user's exposure _balance_*.
In other words, the recommendations are often strongly biased towards one or two musical categories (the user's favorites) and sometimes recommend unrelated items almost "by mistake".

For more information, #link("recodiv_recsys.pdf")[here] is our submission to RecSys 2021, along with the #link("https://github.com/grodino/recodiv")[code].
