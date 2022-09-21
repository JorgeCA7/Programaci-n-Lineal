
# Paso 1: Identificar las variables basicas
# x1 = cantidad de unidades a fabricar de la pieza AA
# x2 = cantidad de unidades a fabricar de la pieza BB

# Paso 2: Identificar las variables "cj"
# c1 = Pieza AA a producir 
# c2 = Pieza BB a producir 

# Paso 3: función objetivo
# Max z = (x1/pieza AA) + (x2/Pieza BB)
# Max z =  X1 + X2

# Paso 4: Identificar "bj"
# b1 = Horas disponibles para el proceso 1 (74880).
# b2 = Horas disponibles para el proceso 2 (27456).
# b3 = Horas disponibles para el proceso 3 (79872).
# b4 = Horas disponibles para el proceso 4 (32448).
# b5 = Horas disponibles para el proceso 5 (27456).

# Paso 5: Identificar "aij"



# Paso 6: Armar restricciones
# (2 hrs/AA)(x1AA) + (1.5 hrs/BB)(x2BB)
# 2x1 + 1.5x2 <= 74880

# (1.5 hrs/AA)(x1AA) 
# 1.5x1 <= 27456

# (2.5 hrs/AA)(x1AA) + (1.5 hrs/BB)(x2BB)
# 2.5x1 + 1.5x2 <= 79872

# (1.5 hrs/BB)(x2BB)
# 1.5x2 <= 32448

# (1.5 hrs/BB)(x2BB)
# 1.5x2 <= 27456



# Paso 7: No negatividad
# x1, x2 >= 0

# Paso 8: Modelo general
# Max z = X1 + X2
# s.a.
# 2x1 + 1.5x2 <= 74880
# 1.5x1 <= 27456
#2.5x1 + 1.5x2 <= 79872
#1.5x2 <= 32448
#1.5x2 <= 27456
# x1, x2 >= 0


# Paso 9 Resolver el sistema

#
install.packages("lpSolve")

# Importar la libreria
library(lpSolve)

# Se guardan en una matriz los coeficientes de la funci?n objetivo
funcion_objetivo <- c(1,1)
funcion_objetivo
# Asignar los coeficientes de las desigualdades
# 2x1 + 1.5x2 <= 74880      2   1.5     (1)
# 1.5x1 <= 27456           1.5   0      (2) 
#2.5x1 + 1.5x2 <= 79872    2.5  1.5     (3)
#1.5x2 <= 32448             0   1.5     (4)
#1.5x2 <= 27456             0   1.5     (5)
# x1, x2 >= 0
# Definir el n?mero de filas en 3
restriciones_derecho <- matrix(c(2,1.5,1.5,0,2.5,1.5,0,1.5,0,1.5), nrow = 5, byrow = T)

# Se muestra el valor de la matriz
restriciones_derecho

# Se guarda en una matriz los simbolos de las desigualdades
restriccion.direccion <- c("<=", "<=", "<=", "<=", "<=")
restriccion.direccion
# Asignar los valores del lado derecho de las desiguldades
# 2x1 + 1.5x2 <= 74880     74880    (1)
# 1.5x1 <= 27456          27456     (2) 
#2.5x1 + 1.5x2 <= 79872    79872    (3)
#1.5x2 <= 32448            32448    (4)
#1.5x2 <= 27456            27456    (5)
lado_derecho.restriccion <- c(74880, 27456, 79872, 32448, 27456)
lado_derecho.restriccion
# Se ejecuta la instrucci?n para mostrar el resultado que maximize la funci?n
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucci?n para mostrar los valores de x1 y x2.
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution
triz necesita trasponerse antes de pasar al c?digo de optimizaci?n. Cuando se tiene un
# tama?o grande de matrices de restricciones es aconsejable construir la matriz de
# restricciones por columnas. En tal caso, se debe poner transpose.constraints= FALSE. 

