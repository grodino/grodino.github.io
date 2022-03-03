+++
title = "LDPC error correcting codes"
date = 2022-02-09
description = "Generation and simulation of LDPC codes"
+++

Used in IEEE 802.11n-2009 (Wi-Fi), 10GB Ethernet and 5G, <span
acronym-label="ldpc" acronym-form="singular+abbrv">ldpc</span> codes are
starting to replace Turbo Codes in systems with a large *code rate*. In
this work, we study <span acronym-label="ldpc"
acronym-form="singular+full">ldpc</span> in two channels: the <span
acronym-label="bec" acronym-form="singular+full">bec</span> and the
<span acronym-label="bmc" acronym-form="singular+full">bmc</span>. To
quantify the performance of the codes, we will compute their <span
acronym-label="BER" acronym-form="singular+full">BER (Bit Error Rate)</span>
*P*<sub>*e*</sub> and <span acronym-label="BLER"
acronym-form="singular+full">BLER (Block Error Rate)</span> *P*<sub>*b*</sub>.

#### Implementation

The LDPC decoding and code generation were implemented in `Rust`. All
the code is thoroughly documented and can be accessed at this address:
<https://github.com/grodino/ldpc>. The commands associated to each
figure in the report are described in the `readme.md` file.


### Report and results

The report with the results can be downloaded [here](https://github.com/grodino/ldpc/releases/download/v0.1/report.pdf)