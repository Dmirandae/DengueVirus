import os
import sys #

# convert command line arguments to variables
kmer_size =  5 #int(sys.argv[1])
count_cutoff = 2 #int(sys.argv[2])

# define the function to split dna
def split_dna(dna, kmer_size):
    kmers = []
    for start in range(0,len(dna)-(kmer_size-1),1):
        kmer = dna[start:start+kmer_size] #extraer de dna de uno a uno hasta llegar al final
        kmers.append(kmer) # cada pedazo de kmer lo va a asignar a kmers
    return kmers

# create an empty dictionary to hold the counts
kmer_counts = {} #diccionario vacio

# process each file with the right name
for file_name in os.listdir("."): #listar todo lo que esta en el directorio
    if file_name.endswith(".dna"): #andswith archivos que terminan en .dna
        dna_file = open(file_name) # abra un puntero dna_file y asignele file_name

        # process each DNA sequence in a file
        for line in dna_file:
            dna = line.rstrip("\n") #remueve el caracter que genera la nueva linea

            # increase the count for each k-mer that we find
            for kmer in split_dna(dna, kmer_size): # crear todos los kamercitos del kamer en dna
                current_count = kmer_counts.get(kmer, 0) #get:sacar.... 0--> variable de extraccion .... cuanto tiene la secuencia
                new_count = current_count + 1
                kmer_counts[kmer] = new_count

# print k-mers whose counts are above the cutoff
for kmer, count in kmer_counts.items(): # recorrero kmer_countd item por item
    if count > count_cutoff:
        print(kmer + " : " + str(count)) # para poder imprimir numeros pasar a str
