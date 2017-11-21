#UCLUST
#USEARCH
# Codigo para buscar y remover secuencias con similaridad del 99.5% en UCLUS-USEARCH

# Para descargar usearch: http://www.drive5.com/usearch/download.html
# Manual de usearch: http://www.drive5.com/usearch/manual/  http://drive5.com/usearch/UsearchUserGuide4.1.pdf

cd ..
cd ..
cd ..

# Ir a la carpeta donde estan los datos

cd LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo

# Ordenas las secuencias por su longitud aceptando una longitud maxima de 12000 pb

./usearch --sort Secuencias_genoma_completo.fasta --output Secuencias_sort.fasta --maxlen 12000 --log log.log

# Identificar y remover las secuencias con el 95, 97, 99, 99.5, 99.9 % de similaridad y dejar las secuencias Disimilares
# seedsout son las secuencias disimilares

./usearch --cluster Secuencias_sort.fasta --maxlen 12000 --id 0.95 --iddef 0 --band 1 --seedsout Secuencias_95_Disimilaridad.fasta --uc result.uc --log log_95.log 

./usearch --cluster Secuencias_sort.fasta --maxlen 12000 --id 0.97 --iddef 0 --band 1 --seedsout Secuencias_97_Disimilaridad.fasta --uc result.uc --log log_97.log

./usearch --cluster Secuencias_sort.fasta --maxlen 12000 --id 0.99 --iddef 0 --band 1 --seedsout Secuencias_99_Disimilaridad.fasta --uc result.uc --log log_99.log 

./usearch --cluster Secuencias_sort.fasta --maxlen 12000 --id 0.995 --iddef 0 --band 1 --seedsout Secuencias_995_Disimilaridad.fasta --uc result.uc --log log_995.log

./usearch --cluster Secuencias_sort.fasta --maxlen 12000 --id 0.999 --iddef 0 --band 1 --seedsout Secuencias_999_Disimilaridad.fasta --uc result.uc --log log_999.log 

# Conocer las secuencias que fueron eliminadas porque son 97% identicas

#Extraer los ids de cada secuencias:

# 1. de las secuencias originales

grep ">" Secuencias_sort.fasta > Secuencias_sort_id.csv

# 2. de las secuencias con el % de Disimilaridad 

grep ">" Secuencias_95_Disimilaridad.fasta > Secuencias_95_Disimilaridad_id.csv

grep ">" Secuencias_97_Disimilaridad.fasta > Secuencias_97_Disimilaridad_id.csv

grep ">" Secuencias_99_Disimilaridad.fasta > Secuencias_99_Disimilaridad_id.csv

grep ">" Secuencias_995_Disimilaridad.fasta > Secuencias_995_Disimilaridad_id.csv

grep ">" Secuencias_999_Disimilaridad.fasta > Secuencias_999_Disimilaridad_id.csv

# Sacar la diferencia entre los dos archivos de ids
# Secuencias originales Vs secuencias con 97% de Disimilaridad

diff Secuencias_sort_id.csv Secuencias_95_Disimilaridad_id.csv > diff_ideff0_95.csv

diff Secuencias_sort_id.csv Secuencias_97_Disimilaridad_id.csv > diff_ideff0_97.csv

diff Secuencias_sort_id.csv Secuencias_99_Disimilaridad_id.csv > diff_ideff0_99.csv

diff Secuencias_sort_id.csv Secuencias_995_Disimilaridad_id.csv > diff_ideff0_995.csv

diff Secuencias_sort_id.csv Secuencias_999_Disimilaridad_id.csv > diff_ideff0_999.csv

# Estraer solo los id de las diferencias entre: 
# Secuencias originales Vs secuencias con 97% de Disimilaridad

grep ">" diff_ideff0_95.csv > diff_ideff_0_95.csv 

grep ">" diff_ideff0_97.csv > diff_ideff_0_97.csv

grep ">" diff_ideff0_99.csv > diff_ideff_0_99.csv  

grep ">" diff_ideff0_995.csv > diff_ideff_0_995.csv

grep ">" diff_ideff0_999.csv > diff_ideff_0_999.csv  

rm diff_ideff0_95.csv
rm diff_ideff0_97.csv
rm diff_ideff0_99.csv
rm diff_ideff0_995.csv
rm diff_ideff0_999.csv

#Ver archivo con los ids de las secuencias con 97% de Disimilaridad y similaridad en 
# nano para modificarlo

# Disimilares

nano Secuencias_95_Disimilaridad_id.csv
nano Secuencias_97_Disimilaridad_id.csv
nano Secuencias_99_Disimilaridad_id.csv
nano Secuencias_995_Disimilaridad_id.csv
nano Secuencias_999_Disimilaridad_id.csv

# Similares

nano diff_ideff_0_95.csv
nano diff_ideff_0_97.csv
nano diff_ideff_0_99.csv
nano diff_ideff_0_995.csv
nano diff_ideff_0_999.csv

# Una ves estemos viendo el archivo seguimos las siguientes instrucciones para eliminar ">"
# ctrl+w (para buscar) y escribimos lo que queremos buscar, en este caso "< >" y enter
# ctrl+\ (para reemplazar) y escribimos lo que queremos reemplazar, en este caso " " y enter
# ctrl+o (para guardar cambios) y listo!!

