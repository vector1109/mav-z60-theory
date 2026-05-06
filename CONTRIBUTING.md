# Contributing to MAV-Z60 Theory

Thank you for your interest in contributing to this repository.

This project is both a mathematical manuscript and an executable computational framework.
Contributions are welcome, but must preserve formal correctness, reproducibility, and canonical structure.

---

## Scope of Contributions

Contributions are welcome in the following areas:

- bug fixes in scripts or exports,
- documentation improvements,
- reproducibility improvements,
- validation extensions,
- portability improvements,
- formal clarifications in proofs and definitions.

---

## Canonical Structure

The following directories are considered canonical and must be treated as stable:

- `Theory/` → formal mathematical manuscript
- `Validation/` → canonical executable validation
- `Core/` → computational primitives
- `README.md` → public repository entry point
- `SPECIFICATION.md` → repository contract

Changes affecting these areas must preserve consistency with the published theory and validation outputs.

---

## Contribution Rules

Please ensure that all contributions:

1. preserve mathematical consistency,
2. preserve reproducibility of canonical outputs,
3. do not silently alter theoretical claims,
4. do not introduce heavy external dependencies,
5. remain consistent with the MPL-2.0 licensing model.

---

## Pull Requests

Pull requests should:

- be focused and minimal,
- include a clear rationale,
- describe impact on reproducibility,
- avoid unrelated structural changes.

If a change affects theory, validation, or canonical outputs, document it explicitly.

---

## Issues

Issues may be used for:

- bug reports,
- reproducibility failures,
- documentation problems,
- theoretical clarifications,
- portability concerns.

Please provide enough detail to reproduce the issue.

---

## Licensing

By contributing to this repository, you agree that your contributions are provided under the terms of the Mozilla Public License 2.0 (MPL-2.0), consistent with the repository license.