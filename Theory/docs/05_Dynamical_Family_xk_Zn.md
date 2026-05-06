# Documento 5 — Familia dinámica general: x ↦ x^k en ℤₙ

## 1. Definición general

Sea \( n \in \mathbb{N} \) y \( k \in \mathbb{N} \).

Se define el sistema dinámico:

\[
f_k(x) = x^k \mod n
\]

Esto induce una familia de sistemas dinámicos finitos sobre \( \mathbb{Z}_n \).

---

## 2. Caso particular previo

El caso estudiado en documentos anteriores corresponde a:

\[
k = 2
\]

Este caso genera dinámica de colapso hacia idempotentes.

---

## 3. Descomposición estructural (CRT)

Si:

\[
n = \prod_{i=1}^{r} p_i^{\alpha_i}
\]

entonces:

\[
\mathbb{Z}_n \cong \prod_{i=1}^{r} \mathbb{Z}_{p_i^{\alpha_i}}
\]

y la dinámica se desacopla:

\[
f_k(x) \leftrightarrow (x_1^k, x_2^k, \dots, x_r^k)
\]

---

## 4. Clasificación dinámica por tipo de k

La estructura del sistema depende críticamente de la relación entre \(k\) y la aritmética multiplicativa de \(n\).

---

### (A) Régimen de colapso

Si \(k\) es "grande" respecto a la estructura multiplicativa local:

- Los elementos tienden a idempotentes
- La dinámica es disipativa
- El sistema converge rápidamente

---

### (B) Régimen de permutación

Si:

\[
\gcd(k, \lambda(n)) = 1
\]

donde \( \lambda(n) \) es la función de Carmichael,

entonces:

- \(f_k\) actúa como permutación sobre \(U(n)\)
- Existen ciclos no triviales
- No hay colapso global

---

### (C) Régimen mixto

Cuando:

\[
\gcd(k, \lambda(n)) \neq 1
\]

el sistema presenta:

- zonas de colapso
- zonas cíclicas
- separación por ideales locales

---

## 5. Estructura de órbitas

Toda órbita de \(x\) es de la forma:

\[
x \to x^k \to x^{k^2} \to \dots
\]

y es eventualmente periódica debido a la finitud del sistema.

---

## 6. Generalización del operador Φ

Existe una extensión natural:

\[
\Phi_k : \mathbb{Z}_n \to E_n
\]

tal que:

- preserva la partición en idempotentes
- es invariante bajo iteración de \(f_k\)

\[
\Phi_k(f_k(x)) = \Phi_k(x)
\]

---

## 7. Relación con estructura de unidades

En el subgrupo de unidades \(U(n)\):

- \(f_k\) induce un endomorfismo de grupo
- la dinámica depende de la estructura de \(U(n)\)
- aparecen ciclos cuya longitud divide el orden de \(k\) en el grupo multiplicativo

---

## 8. Interpretación global

El sistema \(x \mapsto x^k\) define una familia de flujos discretos sobre estructuras finitas:

> El exponente k actúa como parámetro de control entre colapso y permutación.

---

## 9. Caso Z60 (referencia)

En \( \mathbb{Z}_{60} \):

- \(k = 2\): régimen de colapso total
- no hay ciclos no triviales globales
- Φ domina completamente la dinámica

---

## 10. Conclusión

La familia:

\[
(\mathbb{Z}_n, x \mapsto x^k)
\]

define un espacio de sistemas dinámicos discretos clasificados por:

- estructura de \(n\)
- parámetro exponencial \(k\)
- interacción con \( \lambda(n) \)

---

## 11. Cierre conceptual

Este marco transforma la aritmética modular en:

> una teoría de sistemas dinámicos finitos parametrizados con transición entre orden y permutación.