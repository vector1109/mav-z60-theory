# 📐 DOCUMENTO 1 — FUNDAMENTO AXIOMÁTICO DEL SISTEMA Zₙ–DYNAMICS

## Versión 1.0

---

# 0. Objetivo

Este documento establece los axiomas mínimos para definir formalmente el sistema dinámico:

$$
f_k(x) = x^k \bmod n
$$

sobre anillos finitos $\mathbb{Z}_n$, y su interpretación como sistema de grafos dirigidos finitos.

---

# 1. Objeto fundamental

## Axioma 1 (Estructura base)

Para cada entero $n \ge 2$, se define el conjunto:

$$
\mathbb{Z}_n = \{0,1,2,\dots,n-1\}
$$

con operación de multiplicación modular:

$$
\cdot_n : \mathbb{Z}_n \times \mathbb{Z}_n \to \mathbb{Z}_n
$$

---

## Axioma 2 (Dinámica primaria)

Se define una familia de transformaciones:

$$
f_k : \mathbb{Z}_n \to \mathbb{Z}_n
$$

dada por:

$$
f_k(x) = x^k \bmod n, \quad k \in \mathbb{N}, k \ge 1
$$

---

## Axioma 3 (Cierre dinámico)

Para todo $x \in \mathbb{Z}_n$, toda órbita:

$$
\mathcal{O}(x) = \{x, f_k(x), f_k^2(x), \dots\}
$$

permanece contenida en $\mathbb{Z}_n$.

---

# 2. Estructura algebraica subyacente

## Axioma 4 (Descomposición primaria)

Todo $n$ admite factorización:

$$
n = \prod_{i=1}^r p_i^{\alpha_i}
$$

y se asume el isomorfismo estructural:

$$
\mathbb{Z}_n \cong \prod_{i=1}^r \mathbb{Z}_{p_i^{\alpha_i}}
$$

---

## Axioma 5 (Separabilidad dinámica)

La dinámica respeta la descomposición:

$$
f_k(x) \leftrightarrow (f_k(x_1), \dots, f_k(x_r))
$$

donde $x_i \in \mathbb{Z}_{p_i^{\alpha_i}}$.

---

# 3. Estructura de grafos

## Definición 1 (Grafo dinámico)

Se define el grafo:

$$
\mathcal{G}_{n,k} = (V,E)
$$

donde:

- $V = \mathbb{Z}_n$
- $E = \{(x, f_k(x)) \mid x \in \mathbb{Z}_n\}$

---

## Axioma 6 (Determinismo funcional)

Cada nodo tiene exactamente un sucesor:

$$
\forall x \in \mathbb{Z}_n, \exists! y \in \mathbb{Z}_n : (x,y) \in E
$$

---

## Axioma 7 (Finitud estructural)

El grafo $\mathcal{G}_{n,k}$ es finito y dirigido.

---

# 4. Dinámica de órbitas

## Definición 2 (Órbita)

$$
\mathcal{O}_k(x) = \{f_k^t(x) \mid t \ge 0\}
$$

---

## Axioma 8 (Periodicidad eventual)

Toda órbita es eventualmente periódica:

$$
\exists m,p \in \mathbb{N} \text{ tales que } f_k^{m+p}(x) = f_k^m(x)
$$

---

## Axioma 9 (Ausencia de caos)

El sistema no presenta sensibilidad exponencial a condiciones iniciales debido a la finitud del espacio de estados.

---

# 5. Idempotentes estructurales

## Definición 3 (Idempotente)

$$
e \in \mathbb{Z}_n \quad \text{tal que} \quad e^2 \equiv e \pmod n
$$

---

## Axioma 10 (Cierre idempotente)

Todo sistema dinámico $f_k$ induce un conjunto finito de atractores idempotentes:

$$
E_n = \{e \in \mathbb{Z}_n \mid e^2 = e\}
$$

---

## Teorema 1 (Cardinalidad de idempotentes)

$$
|E_n| = 2^r
$$

donde $r$ es el número de primos distintos en la factorización de $n$.

---

# 6. Función estructural Φ

## Definición 4 (Proyección dinámica)

Se define:

$$
\Phi_n : \mathbb{Z}_n \to E_n
$$

como la proyección estructural que asigna a cada $x \in \mathbb{Z}_n$
el idempotente asociado a la componente atractora de su órbita.

donde $e$ es el idempotente estructural determinado por la clase dinámica de $x$.

---

## Axioma 11 (Invariancia dinámica)

$$
\Phi_n(f_k(x)) = \Phi_n(x)
$$

---

# 7. Estructura global del sistema

## Teorema estructural (no probado aquí)

El sistema $(\mathbb{Z}_n, f_k)$ induce:

- una partición de $\mathbb{Z}_n$
- en cuencas de atracción
- indexadas por $E_n$

$$
\mathbb{Z}_n = \bigsqcup_{e \in E_n} \Phi_n^{-1}(e)
$$

---

# 8. Interpretación conceptual

Este sistema formaliza:

> la dinámica discreta del colapso multiplicativo en anillos finitos.

No es un sistema caótico, sino un sistema de:

- colapso estructurado
- proyección idempotente
- partición algebraica del espacio finito

---

# 9. Estado del sistema teórico

- ✔ Axiomas definidos
- ✔ Objeto dinámico formalizado
- ✔ Grafo inducido definido
- ✔ Proyección Φ establecida
- ⟳ teoremas de clasificación en desarrollo

---

# 10. Puerta abierta

Este sistema permite extensiones naturales hacia:

- dinámica $x \mapsto x^k$
- teoría espectral del operador dinámico
- categoría de grafos inducidos por CRT
- análisis de estabilidad estructural en anillos finitos