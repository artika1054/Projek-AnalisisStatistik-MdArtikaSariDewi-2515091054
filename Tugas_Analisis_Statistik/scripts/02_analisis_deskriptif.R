# =================================================================
# SKRIP 2: ANALISIS STATISTIK DESKRIPTIF
# =================================================================
#persiapan
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

kolom_analisis <- "Pendapatan_Tahunan_Miliar_IDR" 

# Pastikan kolom yang dipilih ada di dalam data
if(!kolom_analisis %in% names(data_bersih)) {
  stop(paste("Kolom '", kolom_analisis, "' tidak ditemukan dalam data. Silakan periksa kembali nama kolom pada file 02_analisis_deskriptif.R"))
}

# Pemusatan Data
# -----------------------------------------------------------------
# Mean (Rata-rata)
mean_value <- mean(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste("Mean dari", "Pendapatan_Tahunan_Miliar_IDR:", round(mean_value, 2)))

# Median (Nilai Tengah)
median_value <- median(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste("Median dari", "Pendapatan_Tahunan_Miliar_IDR:", round(median_value, 2)))

# Modus (Nilai yang Paling Sering Muncul)
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_value <- get_mode(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]])
print(paste("Modus dari", "Pendapatan_Tahunan_Miliar_IDR:", mode_value))

#==========--variabel numerik yang lain--=============
vars_numerik <- c(
  "Biaya_Akuisisi_Pelanggan_Juta_IDR",
  "Nilai_Pelanggan_Juta_IDR",
  "Tingkat_Churn_Persen"
)

data_bersih[vars_numerik] <- lapply(
  data_bersih[vars_numerik],
  as.numeric
)

modus <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
library(dplyr)

stat_deskriptif <- data_bersih %>%
  summarise(
    across(
      all_of(vars_numerik),
      list(
        mean   = ~mean(.x, na.rm = TRUE),
        median = ~median(.x, na.rm = TRUE),
        modus  = ~modus(.x)
      )
    )
  )

print(stat_deskriptif)
t(stat_deskriptif) #menampilkan mean, median dan modus
# -----------------------------------------------------------------
# Langkah 2: Ukuran Sebaran Data
# -----------------------------------------------------------------
# Standar Deviasi
sd_value <- sd(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste("Standar Deviasi dari", "Pendapatan_Tahunan_Miliar_IDR:", round(sd_value, 2)))

#->sisa data
sd_deskriptif <- data_bersih %>%
  summarise(
    across(
      all_of(vars_numerik),
      ~sd(.x, na.rm = TRUE),
      .names = "{.col}_sd"
    )
  )

print(sd_deskriptif)
t(sd_deskriptif)

# Range (Jangkauan)
range_value <- range(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste("Range dari", "Pendapatan_Tahunan_Miliar_IDR:", range_value[1], "-", range_value[2]))

#-> sisa data
range_deskriptif <- data_bersih %>%
  summarise(
    across(
      all_of(vars_numerik),
      list(
        min = ~min(.x, na.rm = TRUE),
        max = ~max(.x, na.rm = TRUE)
      )
    )
  )

print(range_deskriptif)
t(range_deskriptif)

# Kuartil dan Ringkasan 5 Angka (Min, Q1, Median, Q3, Max)
summary_value <- summary(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]])
print(paste("Ringkasan 5 Angka untuk","Pendapatan_Tahunan_Miliar_IDR:"))
print(summary_value)

#-> sisa data
kuartil_deskriptif <- data_bersih %>%
  summarise(
    across(
      all_of(vars_numerik),
      list(
        Q1 = ~quantile(.x, 0.25, na.rm = TRUE),
        Q2 = ~quantile(.x, 0.50, na.rm = TRUE),
        Q3 = ~quantile(.x, 0.75, na.rm = TRUE)
      )
    )
  )

print(kuartil_deskriptif)
t(kuartil_deskriptif)

#-----------------------------------------------------------------
# Visualisasi Data
# -----------------------------------------------------------------
# A. Histogram
library(ggplot2)
#Pendapatan Tahunan (Miliar IDR)
hist_plot <- ggplot(data_bersih, aes_string(x = "Pendapatan_Tahunan_Miliar_IDR")) +
  geom_histogram(bins = 20, fill = "skyblue", color = "white") +
  geom_vline(aes(xintercept = mean_value), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = paste("Histogram dari", "Pendapatan_Tahunan_Miliar_IDR"),
    subtitle = paste("Garis merah putus-putus menunjukkan Mean =", round(mean_value, 2)),
    x = "Pendapatan_Tahunan_Miliar_IDR",
    y = "Frekuensi"
  ) +
  theme_minimal()

print(hist_plot)
# Menyimpan histogram ke folder 'results'
ggsave(
  filename = paste0("D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/histogram_", "Pendapatan_Tahunan_Miliar_IDR" , ".png"),
  plot = hist_plot,
  width = 8,
  height = 6
)
print(paste("Histogram disimpan di folder 'results' dengan nama histogram_", "Pendapatan_Tahunan_Miliar_IDR", ".png", sep=""))

#--------------------------------------------------------------------------------
# B. Boxplot
box_plot <- ggplot(data_bersih, aes_string(y = "Pendapatan_Tahunan_Miliar_IDR")) +
  geom_boxplot(fill = "salmon", color = "black") +
  labs(
    title = paste("Boxplot dari", "Pendapatan_Tahunan_Miliar_IDR"),
    y = "Pendapatan_Tahunan_Miliar_IDR"
  ) +
  theme_minimal()

print(box_plot)

# Menyimpan boxplot ke folder 'results'
ggsave(
  filename = paste0("D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/boxplot_", kolom_analisis, ".png"),
  plot = box_plot,
  width = 6,
  height = 8
)
print(paste("Boxplot disimpan di folder 'results' dengan nama boxplot_", "Pendapatan_Tahunan_Miliar_IDR", ".png", sep=""))

#============SELESAI================
