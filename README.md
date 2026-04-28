# laboratorio3
Uso del metodo de la secante, newton y bisección
El método de Newton–Raphson converge más rápido porque tiene convergencia cuadrática, lo que significa que el número de cifras correctas prácticamente se duplica en cada iteración cuando la aproximación inicial es buena y la función es suave; esto ocurre porque utiliza información adicional de la función a través de su derivada, lo que le permite “apuntar” directamente hacia la raíz. 
En cambio, el método de la secante tiene convergencia superlineal (orden ≈ 1.618), ya que aproxima la derivada y por eso es ligeramente más lento que Newton, mientras que el método de bisección es el más lento debido a su convergencia lineal, ya que solo reduce el intervalo a la mitad en cada paso sin aprovechar la forma de la función, aunque a cambio es el más seguro y siempre converge si existe un cambio de signo en el intervalo.

El método de bisección no pudo aplicarse directamente en el intervalo propuesto, ya que la función no presenta cambio de signo en dicho intervalo. Por ello, fue necesario recurrir a métodos abiertos como Newton-Raphson o secante, los cuales no requieren esta condición.
