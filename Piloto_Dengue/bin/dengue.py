# -*- coding: utf-8 -*-
"""
Created on Sat Feb 28 09:43:11 2015

@autor: danne
@email: daniel.epm12@gmail.com

"EL ARTE NO ES UN ESPEJO DE LA REALIDAD
SINO  UN MARTILLO PARA TRANSFORMARLA"
                        BERTORLT BRECHT
"""

#!/usr/bin/python
import os
import glob
import readline
import numpy as np
import random
from Bio import Entrez
from Bio import GenBank

##Imprime si el virus es serotipo 2 o no.

lista =('GU131881.1',
'AF119661.1',
'GU131947.1',
'AY702038.1',
'HQ999999.1', #Gt american/asian
'M20558.1',   #Jm american/asian
'FJ639701.1', #Kh american/asian
'FJ898460.1', #Kn american/asian
'GU131955.1', #Mx american/asian
'GQ199869.1', #Ni american/asian
'EU482545.1', #Pr american/asian
'HQ332189.1', #Ve american/asian
'JN819418.1',) #Vn american/asian
for genoma in lista:
    Entrez.email="andreasilvacala@gmail.com"
    handle=Entrez.efetch(db="nucleotide", id=genoma, rettype="gb", retmode="text")
    definicion= handle.readlines()[1]
    handle.close()
    definicion2=definicion[12:26]
    if definicion2=='Dengue virus 2' or 'Dengue virus type 2' :
       print "%s :SEROTIPO 2..." %(genoma)
    else:
        print "%s :NO ES SEROTIPO 2..." %(genoma)
print "-----------------------"
print "-----------------------"
##Imprime la ubicación del virus
for genoma in lista:
    Entrez.email="andreasilvacala@gmail.com"
    handle=Entrez.efetch(db="nucleotide", id=genoma, rettype="gb", retmode="text")
    definicion= handle.read()
    handle.close()
    for item in definicion.split("\n"):
        if "country" in item:
            pais= item.strip()
            print "%s: %s" %(genoma, pais)
