
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



# Importar la libreria
library(matlib)

# Asignar los coeficientes de las restricciones
# 2x1 + 1.5x2 <= 74880      2   1.5     (1)
# 1.5x1 <= 27456           1.5   0      (2) 
#2.5x1 + 1.5x2 <= 79872    2.5  1.5     (3)
#1.5x2 <= 32448             0   1.5     (4)
#1.5x2 <= 27456             0   1.5     (5)
# x1, x2 >= 0
# Definir el n?mero de columnas en 2 y el n?mero de filas en 3
A<-matrix(c(2,1.15,2.5,0,0,1.5,0,1.5,1.5,1.5), ncol = 2, nrow = 5)

# Asignar los valores del lado derecho de las desiguldades
# 2x1 + 1.5x2 <= 74880     74880    (1)
# 1.5x1 <= 27456          27456     (2) 
#2.5x1 + 1.5x2 <= 79872    79872    (3)
#1.5x2 <= 32448            32448    (4)
#1.5x2 <= 27456            27456    (5)
# x1, x2 >= 0

b<- c(74880, 27456, 79872, 32448, 27456)

# Se grafican las ecuaciones
plotEqn(A,b, xlim=c(0,40000), labels=TRUE)


# Intersecci?n A

# Intersecci?n de la recta de color roja con la de color verde la restricciON 2 con la restriccion 3

# 1.5x1         <= 27456
#2.5x1 + 1.5x2 <= 79872

# entonces las matrices A y B quedan como:
# [A=
#             1.5     0
#             2.5     1.5
# ;B=
#             27456
#             79872
# ]

# Definiendo matricialmente las funciones dentro de R, quedar?a como

A <- matrix(c(1.5,0,2.5,1.5), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A

B <- matrix(c(27456,79872), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r




# Intersecci?n B

# Intersecci?n de la recta de color aul cielo con la recta color verde restriccion 5 con la restriccion 3
#2.5x1 + 1.5x2 <= 79872
#1.5x2         <= 27456

# entonces las matrices A y B quedan como:
# [A=
#             2.5    1.5
#             1.5     0
# ;B=
#            79872
#             27456
# ]

# Definiendo matricialmente las funciones dentro de R, quedar?a como

A <- matrix(c(2.5,1.5,1.5,0), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A

B <- matrix(c(79872,27456), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r





# Intersecci?n C

# Intersecci?n de la recta de color Azul cielo con el eje x2
#       1.5x2 <= 27456
#x1           = 0

# entonces las matrices A y B quedan como:
# [A=
#             0    1.5
#             1     0
# ;B=
#            27456
#             0
# ]

# Definiendo matricialmente las funciones dentro de R, quedar?a como

A <- matrix(c(0,1.5,1,0), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A


B <- matrix(c(27456,0), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r




# Intersecci?n D

# Intersecci?n de la recta de color ROJO con el eje xA
#1.5x1      <= 27456
#        X2 = 0

# entonces las matrices A y B quedan como:
# [A=
#             1.5   0
#             0     1
# ;B=
#            27456
#             0
# ]

# Definiendo matricialmente las funciones dentro de R, quedar?a como

A <- matrix(c(1.5,0,0,1), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A


B <- matrix(c(27456,0), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r


# Por ?ltimo se busca determinar los puntos donde la funci?n se maximice; por 
# lo que simplemente se evalua en la funci?n objetivo cada uno de los puntos 
# encontrados.

# Definiendo la funci?n objetivo

# Para ello escribe el c?digo como
val<-matrix(c(18304, 22741.33,18304,22741.33, 0, 18304, 18304, 0), nrow=4, ncol = 2, byrow=T)
# Mostrar la matriz val
val

FO<-matrix(c(1,1), nrow=2, ncol=1)
# Mostrar la matriz FO
FO


r=val%*%FO
# Mostrar la matriz r
r

##       [,1]
## [1,] 41045
## [2,] 41045
## [3,] 18304
## [4,] 18304

# como se observa la soluci?n ?ptima del sistema es 18304 * 2 con las variables 
# X1=0 y x2=18304 Y  X1=18304 Y X2=0
