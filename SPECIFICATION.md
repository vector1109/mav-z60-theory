# Specification

## Repository Name

`mav-z60-theory`

---

## Purpose

This repository formalizes and implements multiplicative dynamics over finite residue rings, with special emphasis on the canonical dissipative system

[
x \mapsto x^2 \bmod 60.
]

It has two complementary layers:

1. **Theory Layer**
   Formal mathematical classification of multiplicative power dynamics over (\mathbb{Z}_n).

2. **Execution Layer (MAV)**
   Computational validation and visualization of the induced finite dynamical graph.

The repository is not merely a codebase, and not merely a mathematical note.

It is a reproducible arithmetic-dynamics framework.

---

## Core Thesis

Finite multiplicative maps of the form

[
f_k(x)=x^k \bmod n
]

induce deterministic finite dynamical systems whose functional digraphs are fully classifiable from arithmetic data alone.

The topology of these graphs is determined by:

1. the prime decomposition of (n),
2. local dynamics over each (\mathbb{Z}_{p^\alpha}),
3. the arithmetic relation between (k) and (\lambda(n)).

MAV provides executable validation of this classification.

---

## Repository Structure

```text
mav-z60-theory/
│
├── README.md
├── SPECIFICATION.md
│
├── Theory/
│   ├── THEORY_NOTE.md
│   └── docs/
│       ├── 01_Foundations.md
│       ├── 02_Orbits_Idempotents.md
│       ├── 03_Classification_Theorem.md
│       ├── 04_Functional_Digraphs.md
│       └── 05_Dynamics_x_pow_k.md
│
├── Core/
│   ├── Z60_Core.ps1
│   ├── MAV_Core.ps1
│   └── Manivela.ps1
│
├── Z60/
│   ├── Z60_Export.ps1
│   └── Z60_Properties.ps1
│
├── Observers/
│   └── Observer_Opposition.ps1
│
├── Experiments/
│   ├── Experiment_OppositionDensity.ps1
│   └── Experiment_SeedComparison.ps1
│
├── Data/
│   ├── observer_log.csv
│   └── Export/
│       ├── z60_table.csv
│       ├── z60_table.h
│       ├── z60_table.js
│       └── z60_table.py
│
└── Paper/
    └── sections/
        ├── Z60_Validation.ps1
        ├── Z60_Arithmetic.ps1
        ├── MAV_Core.ps1
        ├── MAV_Engine.ps1
        └── Observer_Log.ps1
```

---

## Theory Layer

The theory layer defines the mathematical object.

### 01 — Foundations

Defines (\mathbb{Z}_n) as a finite multiplicative dynamical system and establishes CRT decomposition as the structural axiom.

### 02 — Orbits and Idempotents

Constructs idempotent attractors and explicit orbit collapse under (x \mapsto x^2).

### 03 — Classification Theorem

Defines the global classification map (\Phi) and proves full orbit partitioning by idempotent destination.

### 04 — Functional Digraphs

Defines the induced functional digraph (\mathcal{G}*{n,k}), proves rooted decomposition, and closes the (\mathbb{Z}*{60}) case.

### 05 — Dynamics of (x \mapsto x^k)

Generalizes the framework to arbitrary multiplicative power maps and classifies topological regimes.

### THEORY_NOTE

Unifies the five documents into a coherent theory note.

---

## Execution Layer (MAV)

The execution layer instantiates the theory computationally.

MAV is not the source of the mathematics.

MAV is the execution engine that:

* evaluates transitions,
* materializes orbit structure,
* validates predicted attractors,
* exports reproducible state transitions.

Its role is epistemic and experimental.

---

## Z60 Layer

The Z60 layer provides concrete arithmetic infrastructure.

It contains:

* finite table construction,
* arithmetic export,
* invariant checks,
* cross-language lookup generation.

This layer guarantees deterministic reproducibility of the (\mathbb{Z}_{60}) object.

---

## Observer Layer

Observers detect structural events over execution traces.

Current observers include:

* opposition detection,
* event logging,
* density measurement.

These are not theoretical primitives.

They are experimental probes over the generated dynamics.

---

## Experiment Layer

Experiments validate claims made in the theory layer.

Current experiments include:

* opposition density,
* seed comparison,
* observer event distribution.

These are designed to test stability, invariance, and empirical collapse consistency.

---

## Cross-Language Role

The repository is language-portable by design.

Exports are provided in:

* PowerShell
* Python
* JavaScript
* C header format

This is not incidental.

The arithmetic object is language-independent; only execution changes.

---

## Reproducibility Contract

A valid implementation of this repository must preserve:

1. deterministic arithmetic transitions,
2. stable CRT decomposition,
3. invariant idempotent classification,
4. identical exported transition tables across languages.

If these conditions hold, the implementation is considered equivalent.

---

## What This Repository Is

This repository is:

* a mathematical framework,
* a computational validation layer,
* a reproducible arithmetic-dynamics system,
* a formal theory with executable verification.

---

## What This Repository Is Not

This repository is not:

* a generic simulation sandbox,
* a stochastic engine,
* a symbolic algebra package,
* a claim of new algebraic invention.

Its contribution is structural classification and executable validation.

---

## Research Boundary

The repository closes a formal framework.

It also leaves open three research directions:

1. categorical lift of (\mathcal{G}_{n,k}),
2. spectral analysis of multiplicative functional digraphs,
3. full graph taxonomy under varying (k).

These are the explicit frontier beyond the present scope.
