#remover todo el ambiente de trabajo
rm(list=ls())
#muestra el working directory
getwd()
#creas un working directory
setwd("C:/Users/LABNODO09/Documents/Programación 2019 - 2")
# muestra los archivos del directorio
dir()
# documentacion con help y ?
help(ls)
?ls
#lineas de comando y conexiones
history()
#para saber su clasificación
class()
#instalar paquetes
install.packages("sf", dependencies = T)
#coerción : transformar de cualquier tipo de dato a un caracter
# <- , = , ->
# clasifica los elementos e identifica los niveles
factor()
# tabla de igual longitud donde se agrupan vectores con dif. tipos de datos
data.frame()

###Leyendo peli_hollywood
peli_hollywood <- read.csv("https://raw.githubusercontent.com/jfphlorecti1/UNMSM_programacion/master/data/c1_r_peliculas_hollywood.csv", sep = ",")
peli_hollywood
str(peli_hollywood)
### Hallando el número de registros y columnas
n_registros <- nrow(peli_hollywood)
n_registros
n_columnas <- ncol(peli_hollywood)
n_columnas
### Imprimiendo y accediendo al registro 10
print(peli_hollywood$Budget)
peli_hollywood$Budget[10]
#Usando == para ubicar un elemento en un conjunto
# Usando v_prov[v_prov == "elemento"] == " cambiar nombre"
tail(peli_hollywood, 20)
v_sony = peli_hollywood[peli_hollywood["LeadStudio"] =="Sony",]
v_sony
View(v_sony)
is.na(peli_hollywood$LeadStudio)
v_flag_sony = peli_hollywood$LeadStudio == "Sony"
data_sony = peli_hollywood[v_flag_sony,]
View(data_sony)
### sirve para excluir solo ese término
###
colnames(peli_hollywood)
peli_hollywood[peli_hollywood["Movie"] == "Parker","RottenTomatoes"] = 100
peli_hollywood[peli_hollywood["Movie"] == "Parker","RottenTomatoes"]
###
peli_hollywood[peli_hollywood["Movie"] == "The Tourist","Genre"] = "Comedy"
peli_hollywood[peli_hollywood["Movie"] == "The Tourist","Genre"]
###
peli_hollywood[peli_hollywood["Year"] == 2009,"LeadStudio"] = "Disney"
peli_hollywood[peli_hollywood["Year"] == 2009,"LeadStudio"]
###visualización de las dos columnas que necesitas 
View(peli_hollywood[, c("RottenTomatoes", "ForeignGross")])
### ASIGNARLE UN VALOR
ph1 = peli_hollywood[, c("RottenTomatoes", "ForeignGross")]
###Creamos un una data frame en donde los valores nulos no aparezcan
ph2 = ph1[!is.na(ph1["ForeignGross"]),]
View(ph2)
### Creamos un data frame que tenga todas las peliculas que posean la variable RottenTomatoes y ForeignGross nulas al mismo tiempo (tienen que combinar el 'is.na' con el '&') 
ph3 = ph1[!is.na(ph1["ForeignGross"]) & !is.na(ph1["RottenTomatoes"]),]
View(ph3)
