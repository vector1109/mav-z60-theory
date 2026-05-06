# 📊 DOCUMENTO 2 — ÓRBITAS E IDEMPOTENTES EN \(\mathbb{Z}_{60}\)

## Versión 1.0

---

# 0. Objetivo

Este documento clasifica completamente la dinámica del sistema:

\[
f(x) = x^2 \bmod 60
\]

sobre \(\mathbb{Z}_{60}\), describiendo:

- idempotentes
- cuencas de atracción
- órbitas finitas
- estructura del grafo dinámico

---

# 1. Estructura algebraica base

Se utiliza la descomposición:

\[
\mathbb{Z}_{60} \cong \mathbb{Z}_4 \times \mathbb{Z}_3 \times \mathbb{Z}_5
\]

por el Teorema Chino del Resto.

La dinámica se desacopla como:

\[
f(x) \leftrightarrow (x_4^2, x_3^2, x_5^2)
\]

---

# 2. Idempotentes en \(\mathbb{Z}_{60}\)

## 2.1 Definición

\[
e^2 \equiv e \pmod{60}
\]

---

## 2.2 Clasificación completa

Los idempotentes son exactamente:

\[
E_{60} = \{0, 1, 16, 21, 25, 36, 40, 45\}
\]

---

## 2.3 Interpretación estructural

Cada idempotente corresponde a una combinación binaria:

| Componente | Valor |
|------------|------|
| \(\mathbb{Z}_4\) | 0 o 1 |
| \(\mathbb{Z}_3\) | 0 o 1 |
| \(\mathbb{Z}_5\) | 0 o 1 |

Total:

\[
|E_{60}| = 2^3 = 8
\]

---

# 3. Dinámica global

## 3.1 Propiedad fundamental

Toda órbita es finita y converge a un idempotente:

\[
\forall x \in \mathbb{Z}_{60}, \exists e \in E_{60} :
\exists m \; f^m(x) = e
\]

---

## 3.2 Ausencia de ciclos no triviales

No existen ciclos de período > 1 en \(\mathbb{Z}_{60}\) bajo \(x^2\).

El sistema es **puramente disipativo**.

---

# 4. Cuencas de atracción

Cada idempotente \(e \in E_{60}\) define:

\[
B(e) = \{x \in \mathbb{Z}_{60} \mid \Phi(x) = e\}
\]

---

## 4.1 Tamaños exactos de cuencas

| Idempotente | Tamaño |
|-------------|--------|
| 0  | 2 |
| 1  | 16 |
| 16 | 16 |
| 21 | 8 |
| 25 | 4 |
| 36 | 8 |
| 40 | 4 |
| 45 | 2 |

Verificación:

\[
\sum |B(e)| = 60
\]

---

# 5. Dinámica por componente

## 5.1 En \(\mathbb{Z}_4\)

\[
0 \to 0,\quad 1 \to 1,\quad 2 \to 0,\quad 3 \to 1
\]

---

## 5.2 En \(\mathbb{Z}_3\)

\[
0 \to 0,\quad 1 \to 1,\quad 2 \to 1
\]

---

## 5.3 En \(\mathbb{Z}_5\)

\[
0 \to 0,\quad 1 \to 1,\quad 2 \to 4 \to 1,\quad 3 \to 4 \to 1,\quad 4 \to 1
\]

---

# 6. Profundidad del sistema

## Teorema 1 (profundidad global)

El sistema cumple:

\[
\max_{x \in \mathbb{Z}_{60}} \min \{t : f^t(x) \in E_{60}\} = 2
\]

---

## Interpretación

- algunos elementos colapsan en 1 paso
- otros requieren hasta 2 pasos
- nunca más de 2

---

# 7. Estructura del grafo dinámico

\(\mathcal{G}_{60}\) es un bosque dirigido:

- 60 nodos
- 8 raíces (idempotentes)
- sin ciclos no triviales

---

## Propiedades globales

| Propiedad | Valor |
|-----------|------|
| Nodos | 60 |
| Raíces | 8 |
| Ciclos | solo fijos |
| Profundidad máxima | 2 |
| Entropía | 0 |

---

# 8. Función estructural Φ

## Definición operacional

\[
\Phi(x) = \lim_{t \to \infty} f^t(x)
\]

---

## Propiedades

- invariante: \(\Phi(f(x)) = \Phi(x)\)
- idempotente: \(\Phi(e) = e\)
- partición del espacio

\[
\mathbb{Z}_{60} = \bigsqcup_{e \in E_{60}} B(e)
\]

---

# 9. Interpretación estructural

El sistema no es caótico ni ergódico.

Es un:

> sistema de colapso algebraico en capas finitas inducido por potencia modular.

---

# 10. Estado del conocimiento

- ✔ clasificación completa de órbitas
- ✔ idempotentes explícitos
- ✔ cuencas de atracción calculadas
- ✔ grafo dinámico completamente descrito

---

# 11. Puerta abierta

Este documento habilita:

- generalización a \(\mathbb{Z}_n\)
- estudio de \(x^k\)
- análisis de profundidad estructural
- comparación entre distintos \(n\)

---