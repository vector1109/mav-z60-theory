# Security Policy

## Supported Versions

The current supported release is:

| Version | Supported |
|--------:|:---------:|
| 1.0.x   | Yes |

---

## Security Scope

This repository is a local computational and theoretical framework.

It does **not** include:

- network services,
- remote execution,
- authentication layers,
- secrets,
- embedded credentials,
- telemetry,
- background daemons.

The canonical validation pipeline is local, deterministic, and file-based.

---

## Reporting a Vulnerability

If you discover a security issue, please open a private report or contact the maintainer before public disclosure.

Relevant issues include:

- unsafe file handling,
- unintended code execution,
- destructive file operations,
- export path traversal,
- shell injection risks.

Please include:

- affected file(s),
- reproduction steps,
- expected behavior,
- observed behavior.

---

## Security Model

This repository is designed around:

- local execution,
- deterministic outputs,
- no external service dependency,
- no hidden runtime communication.

Security concerns are therefore primarily limited to local execution and filesystem behavior.