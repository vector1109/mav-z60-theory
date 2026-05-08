# Z60 — System State Specification

## Version: 1.0.0

---

# 1. Purpose

This document defines the **formal invariance conditions** of the Z60 framework.

It specifies what it means for the system to remain:

- mathematically consistent
- computationally reproducible
- structurally equivalent across versions

Any modification to the repository MUST be evaluated against this state model.

---

# 2. Core System Definition

The Z60 system is defined by:

- Finite ring:  
  $$ \mathbb{Z}_{60} $$

- Dynamical map:  
  $$ f(x) = x^2 \bmod 60 $$

- Iterated dynamics:  
  $$ f^{(t)}(x) $$

- Structural projection:  
  $$ \Phi : \mathbb{Z}_{60} \rightarrow E_{60} $$

where:

- $E_{60}$ is the set of idempotents of $\mathbb{Z}_{60}$

---

# 3. System Invariants

The following properties are **STRICT INVARIANTS**:

## 3.1 Cardinality invariance

- |Z60| = 60 must remain unchanged
- No extension or reduction of the state space is allowed

---

## 3.2 Idempotent structure invariance

The set:

$$
E_{60} = \{0, 1, 16, 21, 25, 36, 40, 45\}
$$

MUST remain unchanged.

Any modification that alters this set is considered a **MAJOR BREAKING CHANGE**.

---

## 3.3 Functional consistency

The map:

$$
f(x) = x^2 \bmod 60
$$

must remain:

- deterministic
- total (defined for all x ∈ Z60)
- closed in Z60

---

## 3.4 Graph equivalence

The induced graph:

$$
\mathcal{G}_{60}
$$

must preserve:

- 60 nodes
- deterministic out-degree = 1
- finite convergence to idempotents
- absence of nontrivial cycles (beyond fixed points)

---

## 3.5 Φ invariance

The projection:

$$
\Phi(x)
$$

must satisfy:

- idempotent stability:
  $$ \Phi(e) = e $$
- dynamical invariance:
  $$ \Phi(f(x)) = \Phi(x) $$

---

# 4. Allowed Modifications

## 4.1 Allowed without breaking system

- performance improvements in computation
- export/visualization changes
- documentation updates
- refactoring without semantic change
- validation pipeline improvements

---

## 4.2 Allowed with MINOR version change

- API extensions (new observers, tools)
- additional analysis modules
- extended reporting formats

---

## 4.3 BREAKING changes (MAJOR version)

- modification of f(x)
- modification of Φ
- change in idempotent set
- change in ring structure
- change in graph topology

---

# 5. Validation Requirement

Any change to Core MUST be validated by:

Validation/Run-CanonicalValidation.ps1


and must reproduce:

- same idempotents
- same component structure
- same basin decomposition

---

# 6. System Identity Principle

The system is considered identical across versions if and only if:

> all invariants in Sections 3.1–3.5 hold

Otherwise, the system is considered a **new mathematical object**.

---

# 7. Interpretation

Z60 is not a loose model.

It is a **rigid discrete dynamical object** defined by:

- arithmetic closure
- finite state space
- idempotent collapse structure

Any change must respect this rigidity.

---

# 8. Closing Statement

This specification is the **semantic anchor** of the repository.

All code, theory, and validation must remain consistent with this state model.