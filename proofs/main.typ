#import "lib.typ": *

#show: template.with(
  title: [The Algorithmic Codex],
  subtitle: [Formal Proofs and Complexity Analysis],
  short_title: "Algorithmic Proofs",
  description: [A rigorous compilation of solutions, complexity bounds, and formal correctness
    proofs for competitive programming challenges.],
  abstract: [
    This document serves as a structured archive for algorithmic problem-solving,
    integrating efficient implementation strategies with formal correctness arguments.
    Each entry features a detailed complexity analysis and a human-readable proof.
    Where applicable, we provide formal verification in #link("https://rocq-prover.org/")[Rocq]
    to bridge the gap between algorithmic intuition and mathematical certainty,
    ensuring that the underlying logic remains unimpeachable.
  ],
  creation_date: datetime(year: 2026, month: 06, day: 08),
  authors: (
    (
      name: "Aru",
      link: "https://aruzdh.dev",
    ),
  ),
  bibliography_file: "./bibliography/bibliography.bib",
  paper_size: "us-letter",
  cols: 1,
  h1_prefix: "platform",
  text_lang: "en",
  paragraph_indent: 0em,
  code_font: "IoskeleyMono Nerd Font",
)

#important()[
  To avoid boilerplate for every CSES problem, we use the Rust I/O library
  #link("https://docs.rs/proconio/latest/proconio/")[proconio]. Note that the CSES judge does not
  support external crates, so you will need to replace the `input! { ... }` macro with standard
  library I/O operations before submitting. For example:

  ```rust
  let mut lines = io::stdin().lock().lines().map(|l| l.unwrap());
  let n: i64 = lines.next().unwrap().trim().parse().unwrap();
  let nums: Vec<i64> = lines.next().unwrap().split_whitespace()
                            .map(|x| x.parse().unwrap()).collect();
  ```
  Here, n contains the integer parsed from the first line, and nums is a vector of all integers
  from the second line of the input. Remember to include  ```rust use std::io::{self, BufRead};``` at the top of your file.
]

#include "./content/collections/cses.typ"
#include "./content/collections/leetcode.typ"

