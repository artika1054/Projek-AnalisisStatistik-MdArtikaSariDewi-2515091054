# =================================================================
# SKRIP 1: PERSIAPAN DATA
# =================================================================
library(tidyverse)
library(readr)
# -----------------------------------------------------------------
#memuat dataset
tryCatch({
  file_path <- "D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/scripts/data_startup_saas.csv"
  data <- read_csv(file_path)

#karena variable Tingkat_Churn dibaca <chr> perlu diubah menjadi <dbl> dengan:
  data <- data %>%
    mutate(
      Tingkat_Churn_Persen = as.numeric(Tingkat_Churn_Persen)
    )
  
}, error = function(e) {
  print("Terjadi error saat memuat dataset:")
  print(e$message)
})

# -----------------------------------------------------------------
#Pemeriksaan awal data
print(paste("Dataset berhasil dimuat dari:", file_path))
print("Menampilkan 6 baris pertama data:")
print(head(data))

#tampilan struktur data
print("Menampilkan struktur data:")
glimpse(data)

#ringkasan statistik dasar untuk setiap kolom 
print("Menampilkan ringkasan statistik data:")
summary(data)

# -----------------------------------------------------------------
#Pembersihan data
print("Jumlah missing values per kolom:")
print(colSums(is.na(data)))

data_bersih <- na.omit(data)
data_bersih <- data
#============SELESAI================