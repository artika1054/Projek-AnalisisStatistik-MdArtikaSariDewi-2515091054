# =================================================================
# SKRIP 3: UJI ASUMSI (UJI NORMALITAS)
# =================================================================

# Langkah 0: Persiapan
# -----------------------------------------------------------------
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

kolom_uji <- "Pendapatan_Tahunan_Miliar_IDR"

# Pastikan kolom yang dipilih ada di dalam data
if(!kolom_uji %in% names(data_bersih)) {
  stop(paste("Kolom '", kolom_uji, "' tidak ditemukan dalam data. Silakan periksa kembali nama kolom pada file 03_uji_asumsi.R"))
}

# Langkah 1: Uji Normalitas dengan Metode Visual (Q-Q Plot)
# -----------------------------------------------------------------
# Membuat Q-Q Plot -> data Pendapatan Tahunan 
qq_plot <- ggplot(data_bersih, aes_string(sample = "Pendapatan_Tahunan_Miliar_IDR")) +
  stat_qq() +
  stat_qq_line(color = "red", linetype = "dashed") +
  labs(
    title = "Q-Q Plot untuk Uji Normalitas",
    subtitle = paste("Variabel:", "Pendapatan_Tahunan_Miliar_IDR"),
    x = "Kuantil Teoritis (Normal)",
    y = "Kuantil Sampel"
  ) +
  theme_minimal()

print(qq_plot)

# Menyimpan Q-Q Plot ke folder 'results'
ggsave(
  filename = "D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/qqplot_Nilai_Pelanggan_Juta_IDR.png",
  plot = qq_plot,
  width = 8,
  height = 6
)
print(paste("Q-Q Plot disimpan di folder 'results' dengan nama qqplot_", "Pendapatan_Tahunan_Miliar_IDR", ".png", sep=""))

# -----------------------------------------------------------------
# Membuat Q-Q Plot -> data Nilai pelanggan
qq_plot <- ggplot(data_bersih, aes_string(sample = "Nilai_Pelanggan_Juta_IDR")) +
  stat_qq() +
  stat_qq_line(color = "blue", linetype = "dashed") +
  labs(
    title = "Q-Q Plot untuk Uji Normalitas",
    subtitle = paste("Variabel:", "Nilai_Pelanggan_Juta_IDR"),
    x = "Kuantil Teoritis (Normal)",
    y = "Kuantil Sampel"
  ) +
  theme_minimal()

print(qq_plot)

# Menyimpan Q-Q Plot ke folder 'results'
ggsave(
  filename = "D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/qqplot_Nilai_Pelanggan_Juta_IDR.png",
  plot = qq_plot,
  width = 8,
  height = 6
)
print(paste("Q-Q Plot disimpan di folder 'results' dengan nama qqplot_", "Nilai_Pelanggan_Juta_IDR", ".png", sep=""))


# -----------------------------------------------------------------
# Langkah 2: Uji Normalitas dengan Metode Statistik (Shapiro-Wilk)
# -----------------------------------------------------------------
#data -> Pendapatan_Tahunan_Miliar_IDR
if(nrow(data_bersih) < 5000) {
  shapiro_test_result <- shapiro.test(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]])
  
  print("--- Hasil Uji Normalitas Shapiro-Wilk ---")
  print(shapiro_test_result)
  
  # Interpretasi otomatis
  p_value <- shapiro_test_result$p.value
  if (p_value > 0.05) {
    print(paste("Interpretasi: p-value =", round(p_value, 4), "> 0.05. Data kemungkinan besar terdistribusi normal."))
  } else {
    print(paste("Interpretasi: p-value =", round(p_value, 4), "<= 0.05. Data kemungkinan besar TIDAK terdistribusi normal."))
  }
  
} else {
  print("Jumlah data lebih dari 5000, uji Shapiro-Wilk mungkin tidak akurat. Pertimbangkan uji lain seperti Kolmogorov-Smirnov atau andalkan inspeksi visual (Q-Q Plot).")
}

# -----------------------------------------------------------------
#data -> Nilai_Pelanggan_Juta_IDR
if(nrow(data_bersih) < 5000) {
  shapiro_test_result <- shapiro.test(data_bersih[["Nilai_Pelanggan_Juta_IDR"]])
  
  print("--- Hasil Uji Normalitas Shapiro-Wilk ---")
  print(shapiro_test_result)
  
  # Interpretasi otomatis
  p_value <- shapiro_test_result$p.value
  if (p_value > 0.05) {
    print(paste("Interpretasi: p-value =", round(p_value, 4), "> 0.05. Data kemungkinan besar terdistribusi normal."))
  } else {
    print(paste("Interpretasi: p-value =", round(p_value, 4), "<= 0.05. Data kemungkinan besar TIDAK terdistribusi normal."))
  }
  
} else {
  print("Jumlah data lebih dari 5000, uji Shapiro-Wilk mungkin tidak akurat. Pertimbangkan uji lain seperti Kolmogorov-Smirnov atau andalkan inspeksi visual (Q-Q Plot).")
}

# -----------------------------------------------------------------
#data -> Tingkat_Churn_Persen
if(nrow(data_bersih) < 5000) {
  shapiro_test_result <- shapiro.test(data_bersih[["Tingkat_Churn_Persen"]])
  
  print("--- Hasil Uji Normalitas Shapiro-Wilk ---")
  print(shapiro_test_result)
  
  # Interpretasi otomatis
  p_value <- shapiro_test_result$p.value
  if (p_value > 0.05) {
    print(paste("Interpretasi: p-value =", round(p_value, 4), "> 0.05. Data kemungkinan besar terdistribusi normal."))
  } else {
    print(paste("Interpretasi: p-value =", round(p_value, 4), "<= 0.05. Data kemungkinan besar TIDAK terdistribusi normal."))
  }
  
} else {
  print("Jumlah data lebih dari 5000, uji Shapiro-Wilk mungkin tidak akurat. Pertimbangkan uji lain seperti Kolmogorov-Smirnov atau andalkan inspeksi visual (Q-Q Plot).")
}

#============SELESAI================
