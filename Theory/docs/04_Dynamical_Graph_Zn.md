# Documento 4 — Grafo dinámico inducido por x ↦ x² en ℤₙ

## 1. Objeto fundamental

Sea \( n \in \mathbb{N} \). Definimos el sistema dinámico:

\[
f(x) = x^2 \mod n
\]

Este induce un grafo dirigido finito:

\[
\mathcal{G}_n = (V, E)
\]

donde:

- \(V = \mathbb{Z}_n\)
- \(E = \{(x, f(x)) \mid x \in \mathbb{Z}_n\}\)

---

## 2. Propiedad estructural básica

Cada vértice tiene exactamente:

- grado de salida = 1
- grado de entrada ≥ 0

Por lo tanto:

> \( \mathcal{G}_n \) es un grafo funcional finito (endofunción sobre conjunto finito).

---

## 3. Descomposición del grafo

El grafo se descompone en componentes conexas dirigidas:

\[
\mathcal{G}_n = \bigsqcup_{i} C_i
\]

Cada componente \(C_i\) es de la forma:

- un ciclo (posiblemente de longitud 1)
- con árboles dirigidos hacia el ciclo

---

## 4. Tipos de nodos

En el grafo existen tres clases estructurales:

### (A) Nodos idempotentes

\[
x^2 = x
\]

- son puntos fijos del sistema
- forman ciclos de longitud 1

---

### (B) Nodos transitorios

Elementos que no son periódicos:

\[
x, f(x), f^2(x), \dots \to \text{idempotente}
\]

---

### (C) Nodos periódicos (caso restringido)

En algunos \( \mathbb{Z}_n \), existen ciclos de longitud > 1 en el grupo de unidades.

---

## 5. Estructura global del grafo

El grafo \( \mathcal{G}_n \) tiene forma:

> bosque dirigido de árboles finitos apuntando a ciclos

Cada componente tiene exactamente un atractor cíclico.

---

## 6. Relación con Φ

Existe una proyección canónica:

\[
\Phi : \mathbb{Z}_n \to E_n
\]

tal que:

- cada componente del grafo queda particionada por Φ
- cada fibra \( \Phi^{-1}(e) \) es un subárbol dirigido hacia \(e\)

---

## 7. Propiedades del grafo

### (i) Finito y acíclico fuera de ciclos

No existen ciclos fuera de los atractores.

---

### (ii) Convergencia garantizada

Para todo \(x\):

\[
\exists m \in \mathbb{N} : f^m(x) \in \text{ciclo}
\]

---

### (iii) Profundidad finita

Existe \(D(n)\) tal que:

\[
f^{D(n)}(x) \in E_n
\]

---

## 8. Caso Z60 (referencia estructural)

En \( \mathbb{Z}_{60} \):

- 8 componentes (una por idempotente)
- profundidad máxima = 2
- todos los ciclos son triviales (longitud 1)

---

## 9. Interpretación estructural

El grafo dinámico representa:

> la forma completa del colapso iterativo del anillo finito bajo potencia

No es solo una función iterada, sino una estructura global de flujo determinista.

---

## 10. Conclusión

El sistema \( (\mathbb{Z}_n, x \mapsto x^2) \) puede ser completamente representado como:

\[
\mathcal{G}_n = \text{bosque dirigido de colapso hacia idempotentes}
\]

Este grafo es el objeto matemático fundamental subyacente al sistema dinámico.