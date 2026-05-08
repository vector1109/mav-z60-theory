# Z60 — Freeze Specification v1.0.1

This version defines a stable mathematical runtime for multiplicative power dynamics over Z_n.

## Frozen components:

- Core API signatures
- Tensor structure
- Idempotent definition
- Φ projection invariance
- CRT decomposition model

## Non-breaking guarantee:

Any modification must preserve:

- orbit determinism
- idempotent set structure
- basin partitioning
- graph functional property

## Stability contract:

If any of the following changes:

- f(x,k,n)
- Φ(x)
- tensor schema

→ version must increment (semver required)