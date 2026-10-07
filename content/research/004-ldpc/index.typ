#let frontmatter = (
  title: "LDPC error correcting codes",
  date: datetime(year: 2022, month: 2, day: 9),
  image: "cover.png",
  alt: "Bit error rate of Gallager codes against SNR",
  description: "Generation and simulation of LDPC codes",
  links: (
    report: "https://github.com/grodino/ldpc/releases/download/v0.1/report.pdf",
    code: "https://github.com/grodino/ldpc",
  ),
)

Used in IEEE 802.11n-2009 (Wi-Fi), 10GB Ethernet and 5G, LDPC codes are
starting to replace Turbo Codes in systems with a large _code rate_. In
this work, we study Low-Density Parity-Check (LDPC) codes in two channels:
the Binary Erasure Channel (BEC) and the Binary Memoryless Channel (BMC).
To quantify the performance of the codes, we will compute their Bit Error
Rate (BER) $P_e$ and Block Error Rate (BLER) $P_b$.

=== Implementation

The LDPC decoding and code generation were implemented in `Rust`. All
the code is thoroughly documented and can be accessed at this address:
#link("https://github.com/grodino/ldpc"). The commands associated to each
figure in the report are described in the `readme.md` file.

== Report and results

The report with the results can be downloaded #link("https://github.com/grodino/ldpc/releases/download/v0.1/report.pdf")[here]
