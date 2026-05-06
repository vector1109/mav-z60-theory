# Multiplicative Dynamics over Finite Residue Rings

## A Theory Note on Idempotent Collapse, Functional Digraphs, and Arithmetic Classification

---

## Abstract

This note develops a unified theory of multiplicative dynamical systems over finite residue rings of the form

[
f_k(x)=x^k \bmod n.
]

Although the algebraic structure of (\mathbb{Z}_n) is classical, its interpretation as a finite deterministic dynamical system admits a systematic structural classification not usually presented in standard algebraic treatments.

The framework developed here shows that these systems are completely determined by three arithmetic ingredients:

1. the prime decomposition of (n),
2. the local dynamics on each primary component (\mathbb{Z}_{p^\alpha}),
3. the arithmetic relation between (k) and the Carmichael exponent (\lambda(n)).

This induces a complete classification of the associated functional digraphs, including:

* idempotent attractor structure,
* transient collapse geometry,
* cyclic behavior in the unit sector,
* and global graph topology.

The case ((n,k)=(60,2)) is developed as the canonical fully dissipative example.

---

## 1. Motivation

Finite residue rings are standard objects in algebra and number theory.
Their multiplicative structure is well understood in static terms:

* ring decomposition,
* unit groups,
* idempotents,
* nilpotents,
* Chinese remainder structure.

What is less commonly made explicit is that every multiplicative power map

[
x \mapsto x^k \bmod n
]

defines a deterministic discrete dynamical system over a finite state space.

This simple observation shifts the perspective from static algebra to finite dynamics.

The central question is no longer merely:

> What is the multiplicative structure of (\mathbb{Z}_n)?

but rather:

> What is the global dynamical topology induced by iterating multiplication?

This note addresses that question.

---

## 2. Foundational Principle

Let

[
f_k(x)=x^k \bmod n.
]

Since (\mathbb{Z}_n) is finite, iteration of (f_k) produces a finite deterministic orbit for every initial state.

Thus every such system induces a finite functional digraph

[
\mathcal{G}_{n,k}=(V,E),\qquad
V=\mathbb{Z}_n,\quad
E={(x,f_k(x))}.
]

Each node has out-degree exactly one.

Therefore every multiplicative power map over (\mathbb{Z}_n) is equivalent to a finite directed graph composed of:

* rooted trees,
* directed cycles,
* and trees feeding cycles.

The entire theory reduces to classifying this graph.

---

## 3. Structural Axiom (CRT Decoupling)

Let

[
n=\prod_{i=1}^{r}p_i^{\alpha_i}.
]

By the Chinese Remainder Theorem,

[
\mathbb{Z}*n \cong \prod*{i=1}^{r}\mathbb{Z}_{p_i^{\alpha_i}}.
]

Under this decomposition, the map (f_k) acts componentwise:

[
f_k(x_1,\dots,x_r)=(x_1^k,\dots,x_r^k).
]

This yields the foundational axiom of the theory:

> **Axiom (CRT Decoupling).**
> Every multiplicative dynamical system over (\mathbb{Z}*n) decomposes into independent local dynamical systems over the primary components (\mathbb{Z}*{p_i^{\alpha_i}}).

Thus all global behavior is assembled from local arithmetic dynamics.

---

## 4. Idempotent Skeleton

An element (e\in\mathbb{Z}_n) is idempotent if

[
e^2\equiv e\pmod n.
]

The set of idempotents (E_n) forms the attractor skeleton of the system.

Since each primary component has exactly two idempotents ((0) and (1)), CRT implies:

[
|E_n|=2^r.
]

These idempotents are structural invariants:

* they depend only on (n),
* they do not depend on (k),
* they define the global attractor partition of the graph.

Thus every multiplicative dynamical graph over (\mathbb{Z}_n) is organized around a fixed idempotent skeleton.

---

## 5. Unit-Sector Dynamics

The group of units (U(n)) forms the conservative core of the system.

Restricted to (U(n)), the map becomes

[
u\mapsto u^k.
]

Its behavior is governed by the Carmichael exponent (\lambda(n)).

### Theorem (Permutation Criterion)

The restriction of (f_k) to (U(n)) is bijective if and only if

[
\gcd(k,\lambda(n))=1.
]

This separates two regimes:

* **conservative unit dynamics** (permutational),
* **dissipative unit dynamics** (collapsing).

This criterion controls all nontrivial cycle formation.

---

## 6. Global Topological Regimes

Every graph (\mathcal{G}_{n,k}) belongs to one of three regimes.

### 6.1 Permutational Regime

If

[
\gcd(k,\lambda(n))=1,
]

then the unit sector is purely cyclic.

Units lie on cycles and do not collapse.

---

### 6.2 Dissipative Regime

If

[
\gcd(k,\lambda(n))>1,
]

then the unit sector is non-invertible.

Distinct trajectories merge and collapse toward attractors.

---

### 6.3 Mixed Regime

In general, the global graph contains both:

* cyclic components,
* collapsing components.

Thus most systems are mixed.

---

## 7. Canonical Example: (\mathbb{Z}_{60}) under Squaring

The system

[
x\mapsto x^2 \bmod 60
]

provides the canonical fully resolved dissipative example.

Its structure is:

* (60=2^2\cdot3\cdot5),
* (r=3),
* (2^r=8) idempotents,
* (\lambda(60)=4),
* (\gcd(2,4)=2>1).

Therefore the system is dissipative.

Its graph consists of:

* 60 nodes,
* 8 connected components,
* 8 idempotent roots,
* finite-depth directed trees,
* no nontrivial cycles.

This gives a complete explicit model of dissipative multiplicative collapse.

---

## 8. General Classification Theorem

### Theorem

The functional digraph induced by

[
f_k(x)=x^k \bmod n
]

is completely determined by:

1. the prime decomposition of (n),
2. the local primary dynamics over each (\mathbb{Z}_{p^\alpha}),
3. the arithmetic relation between (k) and (\lambda(n)).

Hence the topology of multiplicative dynamics over (\mathbb{Z}_n) is fully classifiable from arithmetic data alone.

---

## 9. Role of MAV

MAV is not the source of the theory.

MAV is its executable layer.

Its role is:

* instantiate arithmetic states,
* execute the induced transition system,
* render the functional digraph experimentally,
* validate the predicted collapse structure.

Thus MAV is not the mathematical object itself.

It is the computational instrument that makes the object observable.

---

## 10. Scope and Boundary

This work does not introduce new algebraic structures.

Its contribution is organizational.

It reclassifies familiar arithmetic objects as explicitly structured finite dynamical systems and provides a unified graph-theoretic description of their behavior.

The novelty lies not in new algebra, but in explicit dynamical cartography.

---

## 11. Open Direction

The natural continuation of this work is not algebraic invention, but structural expansion.

Three directions remain open:

1. categorical functoriality of (n\mapsto\mathcal{G}_{n,k}),
2. spectral theory of multiplicative functional digraphs,
3. explicit classification of graph families induced by varying (k).

These define the open boundary of the framework.

---

## Conclusion

Multiplicative power maps over finite residue rings define a fully classifiable family of finite deterministic dynamical systems.

Their graphs are arithmetic in origin, finite in structure, and globally constrained by number-theoretic invariants.

They are not chaotic objects.

They are algebraic dynamical machines.
