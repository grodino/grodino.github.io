+++
title = "Queries, Representation & Detection: The Next 100 Model Fingerprinting Schemes"
date = 2025-02-26
description = "How do we evaluate fingerprinting methods and how can we do better?"
+++

[<center><img src="qurd/qurd_logo.svg" width="200" /></center>](https://github.com/grodino/QuRD)

When auditing a machine learning (ML) model, regardless of the access the auditor might have to the
model, there is always the risk of the ModelSwap™ attack. Think of the
[Dieselgate](https://en.wikipedia.org/wiki/Volkswagen_emissions_scandal) scandal. I show you a very
compliant, albeit less powerful model during the audit but swap it for an other model when serving
the users. A way to mitigate the ModelSwap™ attack is to monitor the user-facing model and check if
it is the same that we saw during the audit. Beyond auditing, comparing models is a fundamental task
in ML. Perfomance evaluation, performance prediction, model provenance, model ownership resolution,
unlearning verification are all based on some notion of (pseudo)-metric between models.

[arXiv](https://arxiv.org/abs/2412.13021), [poster](poster.pdf), [code](https://github.com/grodino/QuRD)