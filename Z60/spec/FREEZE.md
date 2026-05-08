# Z60 Canonical Freeze Specification

## Status

CANONICAL FROZEN STATE

Version:

v1.0.0

---

## Purpose

This document defines the canonical frozen structure of the MAV-Z60 system.

The purpose of the freeze is to guarantee:

- reproducibility,
- mathematical consistency,
- stable validation outputs,
- canonical graph structure,
- API continuity,
- semantic version integrity.

---

## Frozen Components

The following components are considered canonical and frozen:

### Theory

- Theory/THEORY_NOTE.md

### Core Runtime

- Core/Z60_Core.ps1

### Validation

- Validation/Run-CanonicalValidation.ps1

### Canonical Outputs

- Validation/Figures/z60_graph_validation.csv
- Validation/Figures/z60_edges.csv
- Validation/Figures/z60_basins.csv
- Validation/Figures/z60_graph_validation.md

### Repository Contracts

- SPECIFICATION.md
- VERSION.txt
- Z60/spec/SEMVER_CONTRACT.md
- Z60/spec/FREEZE.md

---

## Frozen Mathematical Invariants

The following invariants MUST remain stable for v1.x.x:

| Property | Canonical Value |
|---|---|
| Modulus | 60 |
| Map | x -> x² mod 60 |
| Nodes | 60 |
| Components | 8 |
| Idempotents | 0,1,16,21,25,36,40,45 |
| Maximum Depth | 2 |

---

## Breaking Changes

The following changes REQUIRE a MAJOR version increment:

- changing Φ definition,
- changing graph topology,
- changing tensor semantics,
- changing idempotent structure,
- changing canonical outputs,
- changing validation invariants,
- incompatible runtime API changes.

---

## Non-Breaking Changes

The following changes MAY increment MINOR or PATCH:

### MINOR

- new observers,
- new tensor operations,
- new exporters,
- new analysis tools,
- additional documentation.

### PATCH

- typo fixes,
- CI fixes,
- documentation corrections,
- non-structural validation fixes.

---

## Integrity Principle

The canonical system is considered:

> mathematically frozen but computationally extensible.

Extensions must preserve canonical reproducibility.

---

## Freeze Authority

The frozen state is defined by:

- canonical runtime outputs,
- canonical validation artifacts,
- semantic version contract,
- executable reproducibility.

Any deviation invalidates canonical equivalence with v1.0.0.