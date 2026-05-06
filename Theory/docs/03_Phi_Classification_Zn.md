# Documento 3 — Teorema general de clasificación $\Phi$ en $\mathbb{Z}_n$

## 1. Contexto

Se estudia el sistema dinámico:

$$
f(x) = x^2 \mod n
$$

sobre el anillo finito $\mathbb{Z}_n$.

Este sistema induce una partición natural del espacio en clases dinámicas.

---

## 2. Descomposición estructural (CRT)

Sea:

$$
n = \prod_{i=1}^{k} p_i^{\alpha_i}
$$

Entonces:

$$
\mathbb{Z}_n \cong \prod_{i=1}^{k} \mathbb{Z}_{p_i^{\alpha_i}}
$$

El sistema dinámico se desacopla componente a componente:

$$
f(x) \leftrightarrow (x_1^2, x_2^2, \dots, x_k^2)
$$

---

## 3. Estructura local

En cada componente $\mathbb{Z}_{p_i^{\alpha_i}}$:

- Los únicos idempotentes son $0$ y $1$
- Toda órbita pertenece estructuralmente a una de dos clases:
  - **no-unidades** (clase $0$)
  - **unidades** (clase $1$)

Definimos la función local:

$$
\phi_i : \mathbb{Z}_{p_i^{\alpha_i}} \to \{0,1\}
$$

$$
\phi_i(x_i) =
\begin{cases}
0 & \text{si } x_i \text{ no es unidad} \\
1 & \text{si } x_i \text{ es unidad}
\end{cases}
$$

---

## 4. Construcción de $\Phi$ global

Definimos:

$$
\Phi : \mathbb{Z}_n \to E_n
$$

donde $E_n$ es el conjunto de idempotentes de $\mathbb{Z}_n$.

Usando CRT:

$$
\Phi(x) = \text{CRT}(\phi_1(x_1), \phi_2(x_2), \dots, \phi_k(x_k))
$$

---

## 5. Teorema de clasificación dinámica

### Teorema

Para todo $x \in \mathbb{Z}_n$, existe una órbita eventual de $f$
contenida en la fibra $\Phi^{-1}(\Phi(x))$.

La función $\Phi$ clasifica el destino estructural de toda órbita,
aunque no necesariamente su punto límite puntual.

---

## 6. Propiedades fundamentales

### (i) Invariancia dinámica

$$
\Phi(f(x)) = \Phi(x)
$$

---

### (ii) Idempotencia

$$
\Phi(e) = e \quad \forall e \in E_n
$$

---

### (iii) Partición del espacio

$$
\mathbb{Z}_n = \bigsqcup_{e \in E_n} \Phi^{-1}(e)
$$

Cada fibra es una cuenca de atracción estructural.

---

## 7. Interpretación estructural

El operador $\Phi$ actúa como:

> Proyección global del sistema dinámico hacia su esqueleto idempotente

Reduce la dinámica a una clasificación discreta de clases dinámicas terminales.

---

## 8. Caso $\mathbb{Z}_{60}$

En $\mathbb{Z}_{60}$:

- $E_{60}$ tiene $8$ elementos
- Cada elemento define una cuenca de atracción
- Todas las órbitas colapsan en profundidad $\le 2$
- Por ser puramente disipativo, aquí $\Phi(x)$ coincide con el punto límite puntual

---

## 9. Conclusión

El sistema dinámico en $\mathbb{Z}_n$ queda completamente clasificado por:

$$
(\mathbb{Z}_n, f) \longrightarrow (E_n, \Phi)
$$

donde $\Phi$ es la estructura de colapso fundamental del sistema.