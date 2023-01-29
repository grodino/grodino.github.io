+++
title = "Exposure diversity in music recommender systems"
date = 2021-01-28
description = "Study of exposure diversity through the lens of an Heterogeneous Networks diversity measure."
+++


During this five month project with [Fabien Tarissan](https://www-complexnetworks.lip6.fr/~tarissan/), I studied the diversity of the recommendations made by music recommender systems.
We built upon a [diversity measure in heterogeneous networks](https://arxiv.org/abs/2001.01296) and applied it to study the algorithm from [Collaborative Filtering For Implicit Datasets](https://ieeexplore.ieee.org/document/4781121).

**UPDATE**: The extended version of our work was accepted in [Applied Network
Science](https://appliednetsci.springeropen.com/)
- Paper : [pdf](https://doi.org/10.1007/s41109-022-00530-7)

**UPDATE**: I presented our work at the [CNA 2021](https://complexnetworks.org/) conference in Madrid. Here is the related material:
- Extended abstract: [pdf](recodiv_CNA.pdf)
- Presentation slides: [pdf](slides_CNA_2021.pdf)

**Are the music recommendations locking you in a particular genre ?**

Usually, recommendations are known to expose users to a greater diversity of items than what they would have searched themselves.
However, the studies which came to such results only considered one aspect of diversity, namely the *variety* of reached categories.

With our new approach, we were able to show that despite increasing exposure *variety* for all users, **recommendations significanlty reduce user's exposure *balance***. 
In other words, the recommendations are often strongly biased towards one or two musical categories (the user's favorites) and sometimes recommend unrelated items almost "by mistake".

For more information, [here](recodiv_recsys.pdf) is our submission to RecSys 2021, along with the [code](https://github.com/grodino/recodiv).