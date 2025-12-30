# =================================================================
# SKRIP 3: UJI ASUMSI (UJI NORMALITAS)
# =================================================================
#
# TUJUAN:
# 1. Menguji apakah data terdistribusi normal.
# 2. Menggunakan Q-Q Plot dan Uji Shapiro-Wilk.
#
# =================================================================

# -----------------------------------------------------------------
# LIBRARY
# -----------------------------------------------------------------
library(ggplot2)
library(dplyr)

# -----------------------------------------------------------------
# Langkah 0: Persiapan Data
# -----------------------------------------------------------------
# Pastikan data_bersih sudah ada
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

# -----------------------------------------------------------------
# Daftar variabel yang diuji (LANGSUNG NAMA VARIABEL)
# -----------------------------------------------------------------
variabel_uji <- c(
  "Pendapatan_Tahunan_Miliar_IDR",
  "Biaya_Akuisisi_Pelanggan_Juta_IDR",
  "Nilai_Pelanggan_Juta_IDR",
  "Tingkat_Churn_Persen"
)

# -----------------------------------------------------------------
# Path folder results
# -----------------------------------------------------------------
path_results <- "D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/"

# -----------------------------------------------------------------
# Loop untuk setiap variabel
# -----------------------------------------------------------------
for (kolom in variabel_uji) {
  
  cat("\n====================================================\n")
  cat("UJI NORMALITAS UNTUK VARIABEL:", kolom, "\n")
  cat("====================================================\n")
  
  # Cek apakah kolom ada
  if (!kolom %in% names(data_bersih)) {
    warning(paste("Kolom", kolom, "tidak ditemukan. Dilewati."))
    next
  }
  
  # -------------------------------------------------
  # Q-Q Plot
  # -------------------------------------------------
  qq_plot <- ggplot(data_bersih, aes_string(sample = kolom)) +
    stat_qq() +
    stat_qq_line(color = "blue", linetype = "dashed") +
    labs(
      title = "Q-Q Plot Uji Normalitas",
      subtitle = paste("Variabel:", kolom),
      x = "Kuantil Teoritis (Normal)",
      y = "Kuantil Sampel"
    ) +
    theme_minimal()
  
  print(qq_plot)
  
  # Simpan Q-Q Plot
  ggsave(
    filename = paste0(path_results, "qqplot_", kolom, ".png"),
    plot = qq_plot,
    width = 8,
    height = 6
  )
  
  cat("Q-Q Plot disimpan sebagai: qqplot_", kolom, ".png\n")
  
  # -------------------------------------------------
  # Uji Shapiro-Wilk
  # -------------------------------------------------
  if (nrow(data_bersih) < 5000) {
    
    shapiro_result <- shapiro.test(data_bersih[[kolom]])
    print(shapiro_result)
    
    if (shapiro_result$p.value > 0.05) {
      cat("Interpretasi: p-value =", round(shapiro_result$p.value, 4),
          " > 0.05 → Data cenderung NORMAL\n")
    } else {
      cat("Interpretasi: p-value =", round(shapiro_result$p.value, 4),
          " ≤ 0.05 → Data TIDAK normal\n")
    }
    
  } else {
    cat("Jumlah data > 5000, Shapiro-Wilk tidak direkomendasikan.\n")
  }
}

# -----------------------------------------------------------------
# Pesan Akhir
# -----------------------------------------------------------------
cat("\nUji normalitas untuk seluruh variabel telah selesai.\n")
cat("Silakan cek folder 'results' untuk file Q-Q Plot.\n")
