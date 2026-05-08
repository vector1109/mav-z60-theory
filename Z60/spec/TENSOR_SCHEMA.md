# Z60 — Tensor Schema Specification

Version: v1.0.0

This document defines the canonical tensor structure of the Z60 runtime.

---

# 1. Tensor Definition

The canonical multiplication tensor is defined by:

$$
T(a,b) = (a \cdot b) \bmod 60
$$

with:

$$
a,b \in \mathbb{Z}_{60}
$$

The tensor is represented as a complete lookup structure over:

$$
\mathbb{Z}_{60} \times \mathbb{Z}_{60}
$$

---

# 2. Tensor Dimensions

The canonical tensor dimensions are:

```text id="jlwm4d"
60 × 60

Total entries:

3600
3. Canonical Ordering

Tensor ordering is row-major:

(a,b)↦60a+b

Binary LUT index:

index = (a * 60) + b
4. Canonical Binary Encoding

The canonical LUT binary representation is:

unsigned byte array

Each entry stores:

(a⋅b)mod60

using one byte per entry.

Canonical file:

Z60/Data/LUT/z60_multiply_lut.bin
5. Determinism Requirements

The tensor must be:

deterministic,
reproducible,
platform-independent,
ordering-stable,
hash-stable.
6. Frozen Structural Properties

The following properties are frozen:

tensor dimensions,
row-major ordering,
binary encoding,
modular multiplication semantics,
deterministic export structure.
7. Validation Requirements

The tensor must pass:

LUT integrity validation,
canonical hash verification,
algebraic consistency checks,
API compatibility tests.
8. Breaking Changes

The following changes require MAJOR version increment:

tensor dimension changes,
ordering changes,
binary encoding changes,
algebraic semantic changes,
deterministic export changes.
9. Runtime Role

The tensor constitutes the canonical algebraic memory layer of the Z60 runtime.

All higher dynamical operators derive from this tensor structure.