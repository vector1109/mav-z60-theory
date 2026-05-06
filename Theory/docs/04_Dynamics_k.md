# 🔁 DOCUMENTO 4 — DINÁMICA GENERAL DE \(x \mapsto x^k \bmod n\)

## Versión 1.0

---

# 0. Objetivo

Este documento generaliza la dinámica modular desde el caso particular:

\[
x \mapsto x^2 \bmod n
\]

al sistema general:

\[
f_k(x) = x^k \bmod n
\]

con \(k \in \mathbb{N}\), \(k \ge 1\).

El objetivo es describir cómo la variación del exponente \(k\) modifica:

- la estructura de órbitas
- la periodicidad
- la profundidad del sistema
- la topología del grafo dinámico

---

# 1. Sistema general

## Definición 1

Para \(n \ge 2\) y \(k \ge 1\), se define:

\[
f_k : \mathbb{Z}_n \to \mathbb{Z}_n,\qquad f_k(x)=x^k \bmod n
\]

---

## Observación

El caso \(k=2\) es el caso base disipativo estudiado en documentos anteriores.

---

# 2. Invariantes respecto de \(k\)

## Teorema 1 (invariantes estructurales)

Para \(n\) fijo, las siguientes estructuras no dependen de \(k\):

- el espacio de estados \(\mathbb{Z}_n\)
- la descomposición CRT
- el conjunto de idempotentes estructurales \(E_n\)
- la cardinalidad \(|E_n| = 2^r\)

---

## Interpretación

Cambiar \(k\) no cambia el espacio ni sus puntos estructuralmente distinguibles.

Cambia únicamente la dinámica que conecta dichos puntos.

---

# 3. Dependencia dinámica respecto de \(k\)

## Teorema 2

La topología de \(\mathcal{G}_{n,k}\) depende de:

\[
k \pmod{\lambda(n)}
\]

donde \(\lambda(n)\) es la función de Carmichael.

---

## Interpretación

La dinámica sobre el grupo de unidades \(U(n)\) está determinada por la acción:

\[
u \mapsto u^k
\]

y esta depende solo de \(k\) módulo el exponente del grupo.

---

# 4. Régimen disipativo vs permutativo

## Definición 2 (régimen disipativo)

El sistema es **disipativo** si \(f_k\) colapsa órbitas hacia atractores fijos.

Esto ocurre cuando la potencia destruye estructura cíclica en \(U(n)\).

---

## Definición 3 (régimen permutativo)

El sistema es **permutativo** sobre \(U(n)\) si:

\[
u \mapsto u^k
\]

es una permutación del grupo de unidades.

---

## Teorema 3

La dinámica sobre \(U(n)\) es permutativa si y solo si:

\[
\gcd(k,\lambda(n))=1
\]

---

## Consecuencia

- si \(\gcd(k,\lambda(n))=1\): aparecen ciclos no triviales
- si \(\gcd(k,\lambda(n))>1\): aparece colapso estructural

---

# 5. Clasificación dinámica por régimen

## Caso I — Permutativo puro

\[
\gcd(k,\lambda(n))=1
\]

Entonces:

- \(f_k\) es biyectiva en \(U(n)\)
- el núcleo periódico crece
- aparecen ciclos largos
- la dinámica es predominantemente cíclica

---

## Caso II — Mixto

\[
1 < \gcd(k,\lambda(n)) < \lambda(n)
\]

Entonces:

- parte de \(U(n)\) permanece cíclica
- parte colapsa
- aparecen componentes mixtas

---

## Caso III — Disipativo dominante

\[
k \equiv 0 \pmod{\lambda(n)}
\]

Entonces:

- \(u^k = 1\) para toda unidad
- colapso máximo en \(U(n)\)
- profundidad mínima

---

# 6. Profundidad y exponente

## Definición 4

La profundidad global:

\[
D(n,k)=\max_{x\in\mathbb{Z}_n} d(x)
\]

depende de:

- estructura nilpotente
- factorización de \(n\)
- relación entre \(k\) y \(\lambda(n)\)

---

## Principio general

A mayor degeneración de \(k\) respecto de \(\lambda(n)\), menor profundidad y mayor colapso.

A mayor coprimalidad, mayor periodicidad y mayor complejidad cíclica.

---

# 7. Estructura de ciclos

## Teorema 4

Los ciclos terminales de \(\mathcal{G}_{n,k}\) provienen de la acción de \(x \mapsto x^k\) sobre:

\[
U(n)
\]

y su longitud está gobernada por órdenes multiplicativos inducidos por \(k\).

---

## Consecuencia

La estructura cíclica del sistema queda determinada por:

- \(U(n)\)
- \(\lambda(n)\)
- el orden de \(k\) en \(\mathrm{Aut}(U(n))\)

---

# 8. Caso \(k=1\)

\[
f_1(x)=x
\]

El grafo es identidad pura:

- todos los nodos son fijos
- profundidad 0
- máxima rigidez

---

# 9. Caso \(k=2\)

Caso disipativo canónico:

- colapso estructurado
- profundidad baja
- idempotentes dominantes

---

# 10. Caso \(k\) coprimo con \(\lambda(n)\)

Caso cíclico:

- máxima periodicidad
- mínima disipación
- dinámica tipo permutación

---

# 11. Interpretación conceptual

El parámetro \(k\) no altera el espacio.

Altera la **geometría del flujo** sobre el espacio.

\[
(n,k)\quad\leadsto\quad\text{misma base, distinta topología dinámica}
\]

---

# 12. Estado del marco

- ✔ dinámica general formalizada
- ✔ regímenes clasificados
- ✔ transición disipación/permutación descrita
- ✔ dependencia estructural respecto de \(k\) establecida

---

# 13. Puerta abierta

Este documento habilita:

- clasificación de familias \((n,k)\)
- teoría espectral de \(f_k\)
- equivalencia topológica entre grafos \(\mathcal{G}_{n,k}\)
- taxonomía completa de regímenes dinámicos modulares

---