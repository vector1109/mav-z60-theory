# Multiplicative Power Dynamics on Finite Residue Rings

## A Structural Classification of the Maps $x \mapsto x^k \bmod n$

---

## Abstract

We study the finite dynamical systems induced by multiplicative power maps

$$
f_k(x)=x^k \bmod n
$$

over residue rings $\mathbb{Z}_n$.

These maps induce finite functional digraphs whose topology is fully determined by arithmetic structure. We show that the global dynamics decomposes canonically through the Chinese Remainder Theorem, that the idempotent set defines a fixed attractor skeleton depending only on the prime decomposition of $n$, and that the transient and cyclic structure is completely classified by local primary dynamics together with the arithmetic relation between $k$ and the Carmichael exponent $\lambda(n)$.

The system over $\mathbb{Z}_{60}$ under squaring is presented as the canonical fully dissipative model. In that case, the graph decomposes into eight rooted components, each converging to one idempotent in bounded depth and with no nontrivial cycles.

This yields a complete structural classification of multiplicative power dynamics on finite residue rings and establishes the induced functional graph as the canonical geometric object underlying the system.

---

## 1. Introduction

Finite residue rings support a natural class of deterministic multiplicative dynamical systems obtained by iterating modular power maps. Given integers $n \ge 2$ and $k \ge 2$, one defines

$$
f_k(x)=x^k \bmod n.
$$

This induces a discrete-time dynamical system over the finite state space $\mathbb{Z}_n$.

Despite its elementary definition, the induced dynamics is highly structured. Every orbit is finite, every trajectory is eventually periodic, and the global system admits a canonical decomposition into directed components determined entirely by arithmetic data.

The central claim of this work is that multiplicative power dynamics over finite residue rings is not merely computable, but structurally classifiable.

The case $\mathbb{Z}_{60}$ under squaring provides the canonical dissipative model: all trajectories collapse in bounded depth, all attractors are idempotent, and the induced graph is a finite rooted forest with no nontrivial cycles. This example motivates the general theory.

The purpose of this note is to formalize the system, define its canonical graph object, classify its attractor structure, and extend the resulting framework from squaring dynamics to the full family of multiplicative power maps.

---

## 2. Axiomatic Foundation

The fundamental object is the residue ring $\mathbb{Z}_n$ endowed with multiplicative power dynamics

$$
f_k(x)=x^k \bmod n.
$$

For each integer $n \ge 2$, define

$$
\mathbb{Z}_n = \{0,1,\dots,n-1\}.
$$

The map $f_k : \mathbb{Z}_n \to \mathbb{Z}_n$ is well-defined for all $k \ge 1$, and its iterates generate finite orbits

$$
\mathcal{O}_k(x)=\{x,f_k(x),f_k^2(x),\dots\}.
$$

Since $\mathbb{Z}_n$ is finite, every orbit is eventually periodic.

This induces a canonical functional digraph

$$
\mathcal{G}_{n,k}=(V,E),
\qquad
V=\mathbb{Z}_n,\quad
E=\{(x,f_k(x)) : x\in\mathbb{Z}_n\}.
$$

Each vertex has out-degree exactly one, so $\mathcal{G}_{n,k}$ is a finite functional digraph.

The structural attractors of the system are governed by the idempotents of $\mathbb{Z}_n$:

$$
E_n=\{e\in\mathbb{Z}_n : e^2=e\}.
$$

These define the canonical attractor skeleton of the system.

---

## 3. Canonical Dissipative Model: $\mathbb{Z}_{60}$

The canonical dissipative example is the squaring map

$$
f(x)=x^2 \bmod 60.
$$

By the Chinese Remainder Theorem,

$$
\mathbb{Z}_{60}\cong \mathbb{Z}_4\times\mathbb{Z}_3\times\mathbb{Z}_5.
$$

This yields a complete componentwise decomposition of the dynamics.

The idempotents of $\mathbb{Z}_{60}$ are exactly

$$
E_{60}=\{0,1,16,21,25,36,40,45\}.
$$

Thus the system has eight attractor roots.

Every orbit converges to one of these idempotents, no nontrivial cycles occur, and the induced graph is a finite rooted forest of depth at most two.

This makes $(\mathbb{Z}_{60},x\mapsto x^2)$ the canonical fully dissipative multiplicative dynamical system.

---

## 4. Global $\Phi$ Classification on $\mathbb{Z}_n$

Let

$$
n=\prod_{i=1}^r p_i^{\alpha_i}.
$$

By CRT,

$$
\mathbb{Z}_n\cong \prod_{i=1}^r \mathbb{Z}_{p_i^{\alpha_i}}.
$$

This decomposes the global dynamics componentwise.

Each local component admits a binary structural projection onto $\{0,1\}$, distinguishing units from non-units. These local projections assemble canonically into a global projection

$$
\Phi_n:\mathbb{Z}_n\to E_n,
$$

which maps each element to its structural idempotent class.

The map $\Phi_n$ is invariant under dynamics,

$$
\Phi_n(f_k(x))=\Phi_n(x),
$$

and induces a canonical partition

$$
\mathbb{Z}_n=\bigsqcup_{e\in E_n}\Phi_n^{-1}(e).
$$

Thus the full system decomposes into structural attraction fibers indexed by idempotents.

---

## 5. Functional Graph Representation

The induced graph $\mathcal{G}_{n,k}$ is the canonical geometric realization of the system.

Every connected component of $\mathcal{G}_{n,k}$ consists of:

- one directed cycle,
- with finite rooted trees feeding into it.

Thus $\mathcal{G}_{n,k}$ is a finite functional graph in the classical sense.

Its topology decomposes into three structural node classes:

- idempotent nodes (fixed points),
- transient nodes,
- periodic nodes.

The graph therefore represents the complete deterministic flow structure of multiplicative dynamics over $\mathbb{Z}_n$.

---

## 6. General Multiplicative Power Dynamics

We now consider the full family

$$
f_k(x)=x^k \bmod n.
$$

The set of idempotents depends only on $n$, not on $k$, and therefore defines a structural invariant across the entire family.

What changes with $k$ is the geometry of trajectories.

The unit group $U(n)$ governs the cyclic sector of the graph. Restricted to units, $f_k$ acts by exponentiation:

$$
u\mapsto u^k.
$$

Its behavior is controlled by the Carmichael exponent $\lambda(n)$.

### Theorem 6.1 (Permutation Criterion)

The restriction of $f_k$ to $U(n)$ is a permutation if and only if

$$
\gcd(k,\lambda(n))=1.
$$

Thus the global graph exhibits three regimes:

- **Permutational:** cyclic unit dynamics,
- **Dissipative:** collapsing unit dynamics,
- **Mixed:** coexistence of cyclic and collapsing sectors.

This yields a complete arithmetic classification of the topology of $\mathcal{G}_{n,k}$.

---

## 7. Computational Realization (MAV Layer)

The theory defines the mathematical object.

MAV defines its computational realization.

Within the repository, the theoretical object is specified in `Theory/`, the arithmetic engine is implemented in `Core/`, and MAV acts as the execution and validation layer that instantiates the dynamical system computationally.

Thus MAV is not the theory itself.

MAV is the operational layer that computes, renders, exports, and empirically validates the formal object defined by the theory.

This separates mathematical structure from computational execution.

---

## 8. Open Directions

The present framework admits several natural extensions:

1. spectral theory of finite functional graphs $\mathcal{G}_{n,k}$,
2. categorical functoriality under CRT decomposition,
3. entropy and complexity measures for finite multiplicative systems,
4. computational applications of arithmetic dynamical graphs.

These define the natural continuation of the present theory.

---

## 9. Conclusion

Multiplicative power maps over finite residue rings define a fully structured class of finite dynamical systems.

Their dynamics is finite, deterministic, arithmetic, and globally classifiable.

The induced functional graph is the canonical geometric object of the system, and its topology is determined entirely by arithmetic structure.

This establishes multiplicative power dynamics on $\mathbb{Z}_n$ as a complete and structurally classifiable arithmetic dynamical theory.