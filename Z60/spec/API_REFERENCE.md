# Z60 — Canonical API Reference

Version: v1.0.0

This document defines the frozen public API of the Z60 runtime.

---

# 1. Stability Scope

The following functions are considered canonical public interfaces.

Any signature modification requires semantic version review.

---

# 2. Core Functions

## Invoke-Z60Multiply

### Signature

```powershell
Invoke-Z60Multiply([int]$a, [int]$b)

Description

Canonical multiplication over:

Z
60
	​


Returns:

(a⋅b)mod60
Deterministic

Yes.

Invoke-Z60Square
Signature
Invoke-Z60Square([int]$x)
Description

Canonical squaring operator:

x
2
mod60

Used as the primary dynamical operator of the system.

Get-Z60Idempotents
Signature
Get-Z60Idempotents()
Description

Returns the canonical idempotent set:

E
60
	​

={0,1,16,21,25,36,40,45}
Get-Z60Orbit
Signature
Get-Z60Orbit([int]$x)
Description

Returns the complete orbit of:

x↦x
2
mod60

until periodic stabilization.

Get-Z60Graph
Signature
Get-Z60Graph()
Description

Returns the complete functional graph:

G
60
	​


including all nodes and directed edges.

Get-Z60Basins
Signature
Get-Z60Basins()
Description

Returns the canonical basin partition induced by the idempotent projection:

Φ:Z
60
	​

→E
60
	​

3. Canonical Guarantees

The runtime guarantees:

deterministic execution,
stable orbit topology,
invariant idempotent structure,
reproducible validation outputs,
stable LUT ordering,
canonical graph structure.
4. Breaking Changes

The following modifications are considered breaking changes:

changing function signatures,
altering orbit topology,
changing idempotent sets,
modifying LUT ordering,
changing graph depth,
altering canonical exports.

Such changes require MAJOR version increment.

5. Version Binding

This API specification is bound to:

VERSION.txt

and:

Z60/spec/FREEZE.md
6. Runtime Identity

This API defines the canonical executable form of the MAV-Z60 dynamical system.