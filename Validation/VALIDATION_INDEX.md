# MAV-Z60 — Validation Index

Version: v1.0.0

This document defines the canonical validation structure of the MAV-Z60 runtime.

---

# 1. Validation Philosophy

The MAV-Z60 runtime is designed as a deterministic executable algebraic system.

Validation therefore focuses on:

- reproducibility,
- algebraic invariance,
- graph topology stability,
- tensor integrity,
- runtime determinism.

---

# 2. Canonical Validation Pipeline

Primary executable validation:

```powershell id="u0vqkx"
Validation/Run-CanonicalValidation.ps1

3. Validation Layers
3.1 Core API Validation

Script:

Z60/tests/test_core_api.ps1

Purpose:

verifies frozen API signatures,
validates deterministic operators,
validates orbit generation,
validates canonical idempotents.
3.2 Topology Regression Validation

Script:

Z60/tests/test_regression_graph.ps1

Purpose:

freezes graph topology,
validates component count,
validates maximum depth,
validates basin partitioning.

Canonical expected values:

Property	Value
Nodes	60
Components	8
Max Depth	2
3.3 LUT Integrity Validation

Script:

Z60/tests/test_lut_integrity.ps1

Purpose:

validates tensor dimensions,
validates LUT ordering,
validates deterministic binary encoding,
validates SHA256 stability.

Canonical tensor size:

3600 bytes
3.4 System Integrity Validation

Script:

Z60/Core/Versioning/Assert-SystemIntegrity.ps1

Purpose:

verifies canonical file presence,
computes SHA256 hashes,
validates canonical exports,
verifies runtime integrity state.
4. Canonical Artifacts

The following artifacts are canonical:

Artifact	Description
z60_graph_validation.csv	node-level topology
z60_edges.csv	graph edge structure
z60_basins.csv	basin decomposition
z60_graph_validation.md	canonical summary
z60_multiply_lut.bin	tensor binary
z60_multiply_lut.sha256.txt	tensor hash
5. Canonical Validation State

A runtime state is considered valid if:

all validation scripts pass,
all hashes reproduce,
all topology invariants hold,
all canonical exports reproduce identically.
6. Determinism Requirement

All validation outputs must be:

deterministic,
reproducible,
platform-stable,
dependency-independent.
7. CI Integration

Canonical validation is integrated through:

.github/workflows/z60-ci.yml

All pull requests and pushes must pass validation.

8. Runtime Freeze Relationship

Validation enforces:

FREEZE.md,
SEMVER_CONTRACT.md,
API_REFERENCE.md,
TENSOR_SCHEMA.md.
9. Conclusion

The validation layer constitutes the executable verification system of the MAV-Z60 runtime.

It guarantees that the published algebraic structure remains computationally invariant.