# 🌐 DOCUMENTO 3 — ESTRUCTURA DEL GRAFO DINÁMICO \(\mathcal{G}_{n,k}\)

## Versión 1.0

---

# 0. Objetivo

Este documento formaliza el objeto estructural central del sistema:

\[
\mathcal{G}_{n,k}
\]

el grafo dinámico inducido por la transformación:

\[
f_k(x) = x^k \bmod n
\]

sobre \(\mathbb{Z}_n\).

El objetivo es describir su estructura general como objeto matemático finito.

---

# 1. Definición del grafo dinámico

## Definición 1

Sea \(n \ge 2\) y \(k \ge 1\). Se define:

\[
\mathcal{G}_{n,k} = (V,E)
\]

donde:

- \(V = \mathbb{Z}_n\)
- \(E = \{(x,f_k(x)) \mid x \in \mathbb{Z}_n\}\)

con:

\[
f_k(x) = x^k \bmod n
\]

---

## Propiedad 1 (grafo funcional)

\(\mathcal{G}_{n,k}\) es un **grafo funcional finito**:

- cada nodo tiene grado de salida exactamente 1
- el grado de entrada puede variar

---

# 2. Descomposición estructural

## Teorema 1 (descomposición funcional)

Todo grafo funcional finito se descompone como unión disjunta de componentes conexas, cada una formada por:

- un ciclo dirigido
- un conjunto finito de árboles dirigidos que desembocan en ese ciclo

---

## Corolario 1

Toda componente de \(\mathcal{G}_{n,k}\) tiene forma:

\[
\mathcal{C} = \mathcal{T} \to \mathcal{Z}
\]

donde:

- \(\mathcal{T}\): bosque dirigido finito
- \(\mathcal{Z}\): ciclo terminal

---

# 3. Clasificación de componentes

Cada componente conexa pertenece a uno de tres tipos:

---

## Tipo I — Componente idempotente

El ciclo terminal es un punto fijo:

\[
e \to e
\]

con \(e^k \equiv e \pmod n\).

Estas componentes representan cuencas de atracción idempotente.

---

## Tipo II — Componente cíclica

El ciclo terminal tiene longitud \(m > 1\):

\[
x_1 \to x_2 \to \cdots \to x_m \to x_1
\]

Estas componentes aparecen cuando la dinámica en \(U(n)\) induce permutaciones no triviales.

---

## Tipo III — Componente mixta

Un ciclo no trivial con árboles entrantes.

Estructura:

- núcleo periódico
- periferia preperiódica

---

# 4. Estructura global

## Teorema 2 (partición estructural)

\[
\mathcal{G}_{n,k} = \bigsqcup_{i=1}^{c(n,k)} \mathcal{C}_i
\]

donde cada \(\mathcal{C}_i\) es una componente funcional finita.

---

## Invariantes globales

El grafo queda determinado por:

- número de nodos
- número de componentes
- número de ciclos
- distribución de longitudes cíclicas
- profundidad máxima
- distribución de grados de entrada

---

# 5. Profundidad estructural

## Definición 2 (profundidad)

La profundidad de un nodo \(x\) es:

\[
d(x) = \min \{t \ge 0 \mid f_k^t(x) \text{ es periódico}\}
\]

---

## Definición 3 (profundidad global)

\[
D(n,k) = \max_{x \in \mathbb{Z}_n} d(x)
\]

---

## Interpretación

\(D(n,k)\) mide la máxima longitud transitoria del sistema.

---

# 6. Núcleo periódico

## Definición 4

El núcleo periódico del sistema es:

\[
\mathcal{P}_{n,k} = \{x \in \mathbb{Z}_n \mid \exists m>0,\ f_k^m(x)=x\}
\]

---

## Propiedad

\(\mathcal{P}_{n,k}\) es la unión de todos los ciclos terminales.

---

# 7. Cuencas de atracción

Para cada ciclo terminal \(\mathcal{Z}\), se define su cuenca:

\[
B(\mathcal{Z}) = \{x \in \mathbb{Z}_n \mid \mathcal{O}(x)\to\mathcal{Z}\}
\]

Entonces:

\[
\mathbb{Z}_n = \bigsqcup_{\mathcal{Z}\subset \mathcal{P}_{n,k}} B(\mathcal{Z})
\]

---

# 8. Caso disipativo

## Definición 5

El sistema es **puramente disipativo** si todos los ciclos terminales son puntos fijos.

---

## Corolario 2

En un sistema puramente disipativo:

- toda componente es un árbol dirigido
- cada árbol tiene raíz fija
- no existen ciclos no triviales

\(\mathbb{Z}_{60}\) bajo \(x^2\) es de este tipo.

---

# 9. Caso permutativo

## Definición 6

El sistema es **permutativo sobre \(U(n)\)** si \(x \mapsto x^k\) induce una permutación en el grupo de unidades.

En este caso aparecen ciclos no triviales.

---

# 10. Invariantes topológicos

Se definen como invariantes de \(\mathcal{G}_{n,k}\):

- \(N(n,k)\): número de nodos
- \(C(n,k)\): número de componentes
- \(P(n,k)\): número de nodos periódicos
- \(D(n,k)\): profundidad máxima
- \(H(n,k)\): entropía topológica (finita)

---

# 11. Interpretación conceptual

\(\mathcal{G}_{n,k}\) no es solo una codificación de iteración modular.

Es el objeto geométrico discreto que contiene:

- la dinámica
- la estructura algebraica
- la clasificación de estabilidad
- la topología del colapso

---

# 12. Estado del marco

- ✔ grafo dinámico formalizado
- ✔ descomposición estructural definida
- ✔ tipos de componentes clasificados
- ✔ invariantes globales definidos

---

# 13. Puerta abierta

Este objeto habilita:

- teoría espectral del operador dinámico
- clasificación por isomorfismo de grafos
- equivalencia estructural entre \((n,k)\)
- functorialidad inducida por CRT

---