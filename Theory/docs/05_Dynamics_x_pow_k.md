# Document 5 — Dynamics of $x \mapsto x^k$ in $\mathbb{Z}_n$

## Abstract

The previous documents established the complete structure of the dynamical system induced by the squaring map $x \mapsto x^2$ over $\mathbb{Z}_{60}$, and its general classification over $\mathbb{Z}_n$ through idempotent projection and CRT decomposition.

This document generalizes that framework to the full family of multiplicative power maps

$$
f_k(x) = x^k \bmod n
$$

and establishes the general topological regimes of the induced finite dynamical graph.

The result is a complete classification of multiplicative power dynamics over finite residue rings, parameterized by:

1. the prime decomposition of $n$,
2. the local structure of $\mathbb{Z}_{p^\alpha}$,
3. the arithmetic relation between $k$ and $\lambda(n)$, where $\lambda$ is the Carmichael function.

---

## 1. Generalized Dynamical System

Let $n \in \mathbb{N}$, and let $k \ge 2$.

Define the multiplicative power map

$$
f_k : \mathbb{Z}_n \to \mathbb{Z}_n, \qquad f_k(x) = x^k \bmod n.
$$

This induces a deterministic discrete dynamical system on the finite set $\mathbb{Z}_n$, and therefore a directed graph

$$
\mathcal{G}_{n,k} = (V,E), \qquad
V = \mathbb{Z}_n,\quad
E = \{(x,f_k(x)) : x \in \mathbb{Z}_n\}.
$$

Each node has out-degree exactly 1.

Thus $\mathcal{G}_{n,k}$ is a finite functional digraph.

---

## 2. CRT Decomposition

Let

$$
n = \prod_{i=1}^{r} p_i^{\alpha_i}
$$

be the prime decomposition of $n$.

By the Chinese Remainder Theorem,

$$
\mathbb{Z}_n \cong \prod_{i=1}^{r} \mathbb{Z}_{p_i^{\alpha_i}}.
$$

Under this decomposition, each element $x \in \mathbb{Z}_n$ is represented uniquely as

$$
x \leftrightarrow (x_1,\dots,x_r),
\qquad x_i \in \mathbb{Z}_{p_i^{\alpha_i}},
$$

and the dynamics decouples componentwise:

$$
f_k(x) \leftrightarrow (x_1^k,\dots,x_r^k).
$$

Hence the global dynamics is the direct product of local dynamics on the primary components.

---

## 3. Idempotents Are Structural Invariants

An element $e \in \mathbb{Z}_n$ is idempotent if

$$
e^2 \equiv e \pmod n.
$$

The set of idempotents $E_n$ depends only on the prime decomposition of $n$, and not on $k$.

Since each local ring $\mathbb{Z}_{p_i^{\alpha_i}}$ has exactly two idempotents, $0$ and $1$, CRT implies:

$$
|E_n| = 2^r.
$$

Thus the idempotent skeleton of $\mathbb{Z}_n$ is fixed by $n$ alone.

Changing $k$ does not alter the attractor set itself.
It alters only the geometry of the trajectories converging to that set.

This makes the idempotent set a structural invariant of the entire family $\mathcal{G}_{n,k}$.

---

## 4. Dynamics on the Unit Group

Let $U(n)$ denote the group of units of $\mathbb{Z}_n$.

Restricted to $U(n)$, the map $f_k$ becomes the endomorphism

$$
u \mapsto u^k.
$$

This is a group endomorphism of $U(n)$.

Its behavior is governed by the arithmetic relation between $k$ and the exponent of $U(n)$, namely the Carmichael function $\lambda(n)$.

### Theorem 4.1 (Permutation Criterion)

The restriction of $f_k$ to $U(n)$ is a permutation if and only if

$$
\gcd(k,\lambda(n)) = 1.
$$

### Proof

The map $u \mapsto u^k$ is an endomorphism of the finite abelian group $U(n)$.
Such an endomorphism is bijective if and only if exponentiation by $k$ is invertible modulo the exponent of the group, which is $\lambda(n)$. Therefore bijectivity is equivalent to

$$
\gcd(k,\lambda(n)) = 1.
\quad \square
$$

This criterion separates conservative dynamics from dissipative dynamics inside the unit sector.

---

## 5. Topological Regimes of $\mathcal{G}_{n,k}$

The graph $\mathcal{G}_{n,k}$ exhibits three qualitatively distinct regimes.

### 5.1 Permutational Regime

If

$$
\gcd(k,\lambda(n)) = 1,
$$

then $f_k$ acts as a permutation on $U(n)$.

Thus all units lie on cycles, and no collapse occurs inside the unit group.

The non-unit sector may still collapse toward non-unit idempotents.

This produces a mixed graph with cyclic unit components and dissipative non-unit branches.

---

### 5.2 Dissipative Regime

If

$$
\gcd(k,\lambda(n)) > 1,
$$

then $f_k$ is not invertible on $U(n)$.

Distinct units merge under iteration, and trajectories collapse toward smaller invariant subsets.

This produces dissipative trees converging to idempotents or short periodic cycles.

---

### 5.3 Mixed Regime

In general, $\mathcal{G}_{n,k}$ contains both:

* cyclic components inherited from invertible local behavior,
* collapsing trees inherited from non-invertible local behavior.

Thus the global graph is generally mixed: partially conservative, partially dissipative.

---

## 6. Depth of the Dynamical Graph

Define the depth $D_k(n)$ as the maximal transient length before entering the eventual periodic part of the orbit.

By CRT decomposition, the global depth is bounded by the maximal local depth:

$$
D_k(n) = \max_i D_k(p_i^{\alpha_i}).
$$

Thus transient complexity is controlled locally and assembled globally.

This provides a complete structural bound on graph height.

---

## 7. Canonical Dissipative Case: $(n,k) = (60,2)$

The system

$$
f_2(x) = x^2 \bmod 60
$$

is the canonical dissipative case studied in Documents 1–4.

Its properties are:

* $n = 60 = 2^2 \cdot 3 \cdot 5$,
* $r = 3$,
* $|E_{60}| = 8$,
* $\lambda(60) = \mathrm{lcm}(2,2,4)=4$,
* $\gcd(2,\lambda(60)) = 2 > 1$.

Therefore the system lies in the dissipative regime.

Consequently:

* all trajectories collapse,
* no nontrivial unit permutation survives,
* the graph decomposes into 8 rooted components,
* each component converges to one idempotent,
* the maximal depth is finite and bounded.

Thus $\mathbb{Z}_{60}$ under squaring is the canonical fully dissipative finite multiplicative dynamical system.

---

## 8. General Classification Theorem

### Theorem 8.1 (Global Classification of Multiplicative Power Dynamics)

Let

$$
f_k(x)=x^k \bmod n
$$

be the multiplicative power map over $\mathbb{Z}_n$.

Then the induced graph $\mathcal{G}_{n,k}$ is a finite functional digraph whose topology is completely determined by:

1. the prime decomposition of $n$,
2. the local dynamics on each $\mathbb{Z}_{p_i^{\alpha_i}}$,
3. the arithmetic relation between $k$ and $\lambda(n)$.

In particular:

* the idempotent attractor skeleton depends only on $n$,
* the transient geometry depends on local primary dynamics,
* the cyclic structure of the unit sector depends on $\gcd(k,\lambda(n))$.

Hence $\mathcal{G}_{n,k}$ is fully classifiable from arithmetic data alone.

$$
\square
$$

---

## 9. Conceptual Conclusion

The family of maps

$$
x \mapsto x^k \bmod n
$$

defines a complete class of finite multiplicative dynamical systems.

Their graphs are neither arbitrary nor chaotic.

They are arithmetic objects whose topology is fully determined by:

* prime factorization,
* local ring structure,
* unit-group exponent arithmetic.

Thus multiplicative dynamics over $\mathbb{Z}_n$ is not merely computable.

It is structurally classifiable.