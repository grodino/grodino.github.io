+++
title = "Robust ML Auditing using Prior Knowledge"
date = 2025-05-01
description = "How can auditors use prior knowledge to improve the robustness of their audit?"
draft = true

[extra]
paper_authors=[
    {name="Augustin Godinot", url="https://grodino.github.io",affiliation="Université de Rennes, Inria, IRISA/CNRS, PEReN"},
    {name="Jade Garcia Bourrée", affiliation="Inria, Université de Rennes"},
    {name="Martijn De Vos", url="https://devos50.github.io/", affiliation="EPFL"},
    {name="Milos Vujasinovic", url="https://mvujas.com/", affiliation="EPFL"},
    {name="Sayan Biswas", url="https://blitzwas.github.io/", affiliation="EPFL"},
    {name="Gilles Tredan", url="https://homepages.laas.fr/gtredan/", affiliation="LAAS, CNRS"},
    {name="Erwan Le Merrer", url="https://erwanlemerrer.github.io/", affiliation="Inria"},
    {name="Anne-Marie Kermarrec", url="https://people.epfl.ch/anne-marie.kermarrec", affiliation="EPFL"}
]
+++

<center>

{{ paper(url="https://openreview.net/forum?id=AiaVCVDuxF", conference="ICML25")}}
{{ arxiv(url="xxx")}}
{{ code(url="https://github.com/grodino/merlin" )}}

</center>

You are a platform hosting a very clever Machine Learning model to detect hate speech online.

You are a regulator, I am a platform hosting a Machine Learning (ML) model. You want to verify that
my model does not discriminate marginalized populations. I want to have the most accurate model in
average (yes, I like to brag about that 97.98989% accuracy).

If you have no other i

<figure style="width: 20em" class="align-center">
    <img src="game.png" alt="Interactions between the platform, the auditor and the users" class="align-center">
    <center><figcaption>Interactions between the platform, the auditor and the users</figcaption></center>
</figure>