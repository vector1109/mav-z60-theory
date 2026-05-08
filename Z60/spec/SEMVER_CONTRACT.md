# Z60 Semantic Versioning Contract

## 1. Purpose

This document defines the **formal versioning rules** for the Z60 system.

Versioning is not descriptive. It is a **machine-verifiable constraint system** that binds changes in code, theory, and validation.

Any violation of this contract must cause CI failure.

---

## 2. Version Format

All versions MUST follow:

MAJOR.MINOR.PATCH


Defined in `VERSION.txt`.

---

## 3. Semantic Rules

### 3.1 MAJOR version (Structural changes)

Increment MAJOR when any of the following change:

- Definition of the operator Φ
- Core algebra in `Core/`
- Tensor structure or state representation
- Fundamental mathematical model (Zₙ dynamics, idempotent structure)
- Graph generation logic in canonical validation

👉 Any change that alters the **mathematical meaning of the system**

---

### 3.2 MINOR version (Interface / expansion)

Increment MINOR when:

- New API functions are added
- New analysis tools or scripts are introduced
- New exports or data formats are added
- Extensions of existing theory without breaking previous results
- New experimental modules in `Experiments/`

👉 Backward-compatible extension of functionality

---

### 3.3 PATCH version (Fixes only)

Increment PATCH when:

- Bug fixes in scripts or validation
- Correction of numerical errors
- Documentation fixes
- Performance improvements without logical change
- Test corrections without structural impact

👉 No change in mathematical meaning or API

---

## 4. Source of Truth

Version classification MUST be determined by:

1. Diff of `Core/`
2. Diff of `Validation/`
3. Changes in `Theory/` affecting Φ or idempotents
4. Changes in public API surface

Git history is authoritative.

---

## 5. Enforcement Rules (MANDATORY)

### 5.1 CI Failure Conditions

The CI pipeline MUST fail if:

- VERSION.txt does not match detected semantic changes
- MAJOR change is not reflected in version bump
- Core algebra is modified without MAJOR increment
- API changes occur without MINOR increment
- PATCH includes structural modifications

---

### 5.2 Determinism Requirement

Version classification must be:

- deterministic
- reproducible
- independent of human interpretation

---

## 6. Relationship to Mathematical Model

This system treats versioning as part of the mathematical structure:

- Core algebra → MAJOR space
- Morphisms / API → MINOR space
- Local corrections → PATCH space

Thus:

> Versioning is an external projection of internal structural change.

---

## 7. Version Stability Principle

Once a version is released:

- its validation output is frozen
- its graph structure is considered canonical
- its Φ mapping is immutable

Any modification requires version increment.

---

## 8. Summary

Z60 is not only a mathematical system.

It is a **versioned axiomatic computational object**, where:

- structure determines version
- version encodes structure
- CI enforces consistency