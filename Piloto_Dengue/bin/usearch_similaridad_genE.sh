#UCLUST
#USEARCH
# Codigo para buscar y remover secuencias con similaridad del 99.5% en UCLUS-USEARCH

# Para descargar usearch: http://www.drive5.com/usearch/download.html
# Manual de usearch: http://www.drive5.com/usearch/manual/  http://drive5.com/usearch/UsearchUserGuide4.1.pdf

cd ..
cd ..
cd ..

# Ir a la carpeta donde estan los datos

cd LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE

# Ordenas las secuencias por su longitud aceptando una longitud maxima de 12000 pb

./usearch --sort Gen_E.fasta --output GenE_sort.fasta --maxlen 1600 --log log.log

# Identificar y remover las secuencias con el 99.5% de similaridad

./usearch --cluster GenE_sort.fasta --maxlen 1600 --id 0.97 --iddef 0 --band 1 --seedsout GenE_97_similaridad.fasta --uc result.uc --log log_97.log 

# Conocer las secuencias que fueron eliminadas porque son 99.5% identicas

#Extraer los ids de cada secuencias:
# 1. de las secuencias originales

grep ">" GenE_sort.fasta > GenE_sort_id.fasta

# 2. de las secuencias con el 97% de similaridad 

grep ">" GenE_97_similaridad.fasta > GenE_97_similaridad_id.csv

# Sacar la diferencia entre los dos archivos de ids
# Secuencias originales Vs secuencias con 97% de similaridad

diff GenE_sort.fasta GenE_97_similaridad.fasta > diff_ideff0_97.csv

# Estraer solo los id de las diferencias entre: 
# Secuencias originales Vs secuencias con 97% de similaridad

grep ">" diff_ideff0_97.csv > diff_ideff_0_97.csv 

rm diff_ideff0_97.csv

#Ver archivo con los ids de las secuencias con 97% de similaridad en 
# nano para modificarlo

nano GenE_97_similaridad_id.csv

# Una ves estemos viendo el archivo seguimos las siguientes instrucciones para eliminar ">"
# ctrl+w (para buscar) y escribimos lo que queremos buscar, en este caso "< >" y enter
# ctrl+\ (para reemplazar) y escribimos lo que queremos reemplazar, en este caso " " y enter
# ctrl+o (para guardar cambios) y listo!!

