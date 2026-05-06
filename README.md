````markdown
# MAV–Z60 Theory  
### Multiplicative Dynamics over Finite Residue Rings

![License](https://img.shields.io/badge/license-MPL--2.0-blue.svg)
![PowerShell](https://img.shields.io/badge/PowerShell-5%2B-5391FE)
![Python](https://img.shields.io/badge/Python-3.x-3776AB)
![Status](https://img.shields.io/badge/status-theory%20%2B%20execution-black)
![Domain](https://img.shields.io/badge/domain-arithmetic%20dynamics-darkred)

---

## Overview

This repository formalizes and executes multiplicative dynamics over finite residue rings of the form

\[
f_k(x)=x^k \bmod n.
\]

Its purpose is to treat finite modular arithmetic not only as algebra, but as a deterministic dynamical system with explicit graph topology.

The repository combines:

- a **formal theory layer** (classification, theorems, structural proofs),
- an **execution layer (MAV)** for computational validation,
- a **portable arithmetic layer** exported across multiple languages.

The canonical case developed here is:

\[
x \mapsto x^2 \bmod 60,
\]

used as the minimal fully resolved dissipative example.

---

## Core Thesis

Finite multiplicative maps induce finite deterministic dynamical systems.

Their functional digraphs are not arbitrary.

They are fully determined by arithmetic structure.

For

\[
f_k(x)=x^k \bmod n,
\]

the topology of the induced graph is completely determined by:

1. the prime decomposition of \(n\),
2. the local dynamics over each \(\mathbb{Z}_{p^\alpha}\),
3. the arithmetic relation between \(k\) and \(\lambda(n)\).

This repository formalizes that claim and validates it computationally.

---

## Repository Structure

```text
mav-z60-theory/
│
├── README.md
├── LICENSE
├── NOTICE
├── SPECIFICATION.md
│
├── Theory/
│   ├── LICENSE
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
````

---

## Theory

The `Theory/` directory contains the formal mathematical framework.

It develops:

* CRT decomposition as structural axiom,
* idempotent attractor classification,
* orbit partitioning,
* functional digraph topology,
* generalized dynamics of (x \mapsto x^k).

The unified paper is available in:

```text
Theory/THEORY_NOTE.md
```

---

## Execution (MAV)

MAV is the executable layer of the framework.

It is not the mathematical source of the theory.

Its role is to:

* instantiate arithmetic states,
* execute transitions,
* detect orbit collapse,
* validate graph structure empirically.

MAV is the instrument that makes the arithmetic object observable.

---

## Quick Start (PowerShell)

Load the arithmetic core:

```powershell
. .\Core\Z60_Core.ps1
```

Run the canonical squaring system:

```powershell
Seed-MAV
Run-MAV -Steps 60
```

Observe collapse events:

```powershell
. .\Observers\Observer_Opposition.ps1
$events = Get-Oppositions
$events
```

Run reproducible experiments:

```powershell
. .\Experiments\Experiment_SeedComparison.ps1
Show-SeedComparison
```

---

## Canonical Result

For the canonical system

[
x \mapsto x^2 \bmod 60,
]

the induced functional digraph is fully classified:

* 60 total states,
* 8 connected components,
* 8 idempotent attractors,
* no nontrivial cycles,
* finite bounded collapse depth.

This is the canonical fully dissipative case.

---

## Cross-Language Exports

The arithmetic layer is exported in portable form:

* PowerShell
* Python
* JavaScript
* C header format

All exported tables encode the same deterministic arithmetic object.

Execution varies by language.

Structure does not.

---

## What This Repository Contributes

This repository does **not** propose new algebra.

Its contribution is:

* explicit dynamical organization of classical arithmetic,
* complete graph-theoretic classification,
* executable validation of multiplicative collapse.

The novelty is structural and organizational.

Not algebraic invention.

---

## Research Boundary

This repository closes a formal framework and leaves open three research directions:

1. categorical lift of multiplicative functional digraphs,
2. spectral theory of arithmetic dynamical graphs,
3. full topology classification under varying exponents (k).

These define the open research boundary.

---

## License

This repository uses a layered licensing model:

* **Computational Stack** (`Core/`, `Z60/`, `Observers/`, `Experiments/`, `Data/Export/`)
  Licensed under **MPL-2.0**

* **Theory / Formal Documentation** (`Theory/`)
  Licensed under **CC BY 4.0**

```
```
