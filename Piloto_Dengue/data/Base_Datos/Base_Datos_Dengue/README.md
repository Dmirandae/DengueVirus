# Data base Dengue #

### Description ###

The database "bd_Dengue" contain all the cases registered of the Dengue virus in the GenBank database until September of 2016 generated on the search of key word "Dengue virus[organism]" with Rentrez package in R.

This database have description of the serotype, genotype, gen,
country (with geographic coordinates), localization (with geographic coordinates), and date of every cases.

The database is part of a research about Dengue virus genetics distances using free alignment methods. and their relation with the time and geographic development in the Systematics and Biogeographic laboratory of the Industrial University of Santander, Colombia.

----------------

The database have the next variables:
**1.** accession number (`N_Accesion`):
 This column contain the accession number of each case.

**2.** gb title (`Title`):
 This column have the title of gb for each accession number

**3.** serotype (`Serotype`):
 This column contain the serotype reported for GenBank for each case:

 - Chimeric --> Sequences quimeric designated by NCBI.
 - Clone --> Sequences Clone designated by NCBI.
 - DENV --> Sequences of Dengue without designated serotype.
 - DENV_1 --> Dengue virus 1 sequences.
 - DENV_2 --> Dengue virus 2 sequences.
 - DENV_3 --> Dengue virus 3 sequences.
 - DENV_4 --> Dengue virus 4 sequences.
 - UNVERIFIED --> Unverified sequences designated by NCBI.

**4.** Genotype (`Genotype`):
 This column contain the Genotype for each serotype of following form:  
 - **DENV_1:**
 - Cosmopolitan --> Genotype IV
 - I --> Genotype I
 - II --> Genotype II
 - III --> Genotype III
 - IV --> Genotype IV
 - V --> Genotype V
 - NA --> Not Genotype reported.
 - **DENV_2:**
 - American --> Genotype V
 - American_Asian --> Genotype III
 - Asian
 - Asian_I --> Genotype II
 - Asian_II --> Genotype I
 - Cosmopolitan --> Genotype IV
 - II --> Genotype II
 - IV --> Genotype IV
 - NA --> Not Genotype reported
 - V --> Genotype V
 - **DENV_3:**
 - I --> Genotype I
 - II --> Genotype II
 - III --> Genotype III
 - NA --> Not Genotype reported
 - V --> Genotype V           
 - **DENV_4:**
 - I --> Genotype I
 - II --> Genotype II
 - III --> Genotype III
 - NA --> Not Genotype reported

**5.** Gen Name (`Gen`):
 This column was created from the column 'Title' in openRefine:

 - 3_UTR --> 3'UTR
 - 5_UTR --> 5'UTR
 - 53_UTR --> 3' UTR and 5'UTR
 - C --> Capside Gene
 - C_M --> Capside and Membrane Genes
 - C_prM --> Capside and preMembrane Genes
 - C_prM_E --> Capside, preMembrane and Envelope Genes
 - C_prM_M_E --> Capside, preMembrane, Membrane and Envelope Genes
 - Complete_Genome --> Complete Genome
 - E --> Envelope Gene
 - E_NS1 --> Envelope and non structural 1 Gene
 - E_NS1_NS2A --> Envelope, non structural 1 and non structural 2a Genes
 - M --> Membrane Gene
 - M_E --> Membrane and Envelope Genes
 - M_E_NS1 --> Membrane, Envelope Genes and non structural 1 Genes
 - NA --> Unverified Sequences and unassigned Sequences
 - Nonfuncional_Polyprotein --> Nonfunctional Sequences due to mutation
 - NS1 --> Non structural 1 Gene
 - NS1_NS2 --> Non estructural 1 and non structural 2 Genes
 - NS2A --> Non strucrural 2a Gene
 - NS2A_NS2B --> Nn structural 2a and non structural 2b Genes
 - NS2A_NS4B --> Non structual 2a and non structural 4b Genes
 - NS2B --> Non structural 2b Gene
 - NS3 --> Non structural 3 Gene
 - NS4A --> Non structural 4a Gene
 - NS4B --> Non structural 4b Gene
 - NS5 --> Non structural 5 Gene
 - NS5_3UTR --> Non structural 5 Gene and 3'UTR
 - Partial_Genome --> Partial genome sequences
 - Polyprotein_Gene --> Polysequence contains varios genes
 - prM --> preMembrane Gene
 - prM_E --> preMembrane and envelope Gene
 - prM_M --> preMembrane and membrane Gene
 - prM_M_E --> preMembrane, membrane and envelope genes.

**6.** Length of Sequence (`Size_Sequence`):
 This column contain the Length of the each sequence

**7.** Country (`Country`):
 This column has names of the country when was reported each case. The cases with NA in this column it not know

**8.** Location (`Location`):
 This column contain the names of the location for each case. This location can be a region, districts, department, or city. The cases with NA in this column it not know

**9.** Year  (`Year`):
 This column has the year reported for each case. The cases with NA in this column it not know

**10.** Month (reported)(`Month`):
 This column has the month reported for the cases. The cases with NA in this column it not know.

 - Jan --> January
 - Feb --> February
 - Mar --> March
 - Apr --> April
 - May --> May
 - Jun --> June
 - Jul --> July
 - Aug --> August
 - Sep --> September
 - Oct --> October
 - Nov --> November
 - Dec --> December
 - NA --> it not know.

**11.** country geographical coordinates (lat/lon) (`lat_country` and `lon_country`):
The geographic coordinates was obtained from the names of the countries using the API Google Maps in R with the script coordenadas.R

**12.** country localization class (see below)(`locationtype_country`):
This information is obtained from the research of coordinates in Google Maps(API). This information is a description about the type of geographic coordinates found for Google Maps from the name of the country or localization, it can be three types forms. The following are the different location types:

 - "ROOFTOP" indicates that the returned result is a precise geocode for which we have location information accurate down to street address precision.
 - "RANGE_INTERPOLATED" indicates that the returned result reflects an approximation (usually on a road) interpolated between two precise points (such as intersections). Interpolated results are generally returned when rooftop geocodes are unavailable for a street address.
 - "GEOMETRIC_CENTER" indicates that the returned result is the geometric center of a result such as a polyline (for example, a street) or polygon (region).
 - "APPROXIMATE" indicates that the returned result is approximate.

**13.** country formatted (`formatted_country`):
Description of name place found for Google Maps for each original place of the database.

**14.** location geographical coordinates (lat/lon) (`lat_location` and `lon_location`):
The geographic coordinates was obtained from the names of the localizations and your countries respectively using the API Google Maps in R with the script coordenadas.R

**15.** location localization class (see below) (`locationtype_country`):
This information is obtained from the research of coordinates in Google Maps(API). This information is a description about the type of geographic coordinates found for Google Maps from the name of the country or localization, it can be three types forms. The following are the different location types:

 - "ROOFTOP" indicates that the returned result is a precise geocode for which we have location information accurate down to street address precision.
 - "RANGE_INTERPOLATED" indicates that the returned result reflects an approximation (usually on a road) interpolated between two precise points (such as intersections). Interpolated results are generally returned when rooftop geocodes are unavailable for a street address.
 - "GEOMETRIC_CENTER" indicates that the returned result is the geometric center of a result such as a polyline (for example, a street) or polygon (region).
 - "APPROXIMATE" indicates that the returned result is approximate.

**16.** location formatted (`formatted_country`):
Description of name place found for Google Maps for each original place of the database.

**17.** Comments (`Comments`):
Orginal column downloaded from the genbank with the information of country, locality, month and year of registration, as well as the source of isolation of each sample

----------------

### How was created this file: ###

- The information of the database was download of GenBank on the search of key word "Dengue virus[organism]" using the Rentrez R package. (Implemented in: `bd_genbank.R`)

- The columns 'Country', 'Location', 'Year' and 'Month' were generated in base to the column 'Comments' using the functions grepl and math in R with the script `bd_cleaning.R`

- The database was open in `openRefine` for unifiqued the names and remove space and special characters

- The geographic coordinates was obtained from the names of the countries and locations using the API Google Maps in R with the script `coordenadas.R`

------------------
### Version ###
 - Version: 0.1
 - Date: 2017-07-31
-----------------

### LICENSE ###

This database contain information available in the GenBank.
- Benson, D. A., Karsch-Mizrachi, I., Lipman, D. J., Ostell, J., & Sayers, E. W. (2010). GenBank. Nucleic Acids Research, 38(Database issue), D46–D51. http://doi.org/10.1093/nar/gkp1024
