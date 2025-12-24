# =================================================================
# SKRIP 4: ANALISIS KORELASI
# =================================================================
#Keterangan:
#Variabel x : Pendapatan_Tahunan_Miliar_IDR
#Variabel y : Nilai_Pelanggan_Juta_IDR


# Persiapan
# -----------------------------------------------------------------
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

var_x <- "Pendapatan_Tahunan_Miliar_IDR" 
var_y <- "Nilai_Pelanggan_Juta_IDR"

if(!var_x %in% names(data_bersih) || !var_y %in% names(data_bersih)) {
  stop(paste("Satu atau kedua kolom ('", var_x, "', '", var_y, "') tidak ditemukan. Periksa kembali nama kolom pada file 04_analisis_korelasi.R"))
}

# -----------------------------------------------------------------
#Visualisasi Hubungan dengan Scatter Plot
# -----------------------------------------------------------------
scatter_plot <- ggplot(data_bersih, aes_string(x = var_x, y = var_y)) +
  geom_point(alpha = 0.6, color = "red") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title = paste("Scatter Plot antara", var_x, "dan", var_y),
    subtitle = "Garis merah menunjukkan tren linear",
    x = var_x,
    y = var_y
  ) +
  theme_minimal()

print(scatter_plot)

# Menyimpan scatter plot ke folder 'results'
ggsave(
  filename = paste0("D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/scatterplot_", "Pendapatan_Tahunan_Miliar_IDR", "_vs_", "Nilai_Pelanggan_Juta_IDR", ".png"),
  plot = scatter_plot,
  width = 8,
  height = 6
)
print(paste("Scatter plot disimpan di folder 'results'."))

# -----------------------------------------------------------------
# Langkah 2: Menghitung Koefisien Korelasi
# -----------------------------------------------------------------
correlation_test <- cor.test(
  data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]],
  data_bersih[["Nilai_Pelanggan_Juta_IDR"]],
  method = "spearman"
)

print(paste("--- Hasil Uji Korelasi antara", var_x, "dan", var_y, "---"))
print(correlation_test)

# Interpretasi otomatis
cor_value <- as.numeric(correlation_test$estimate)
p_value <- correlation_test$p.value

print("--- Interpretasi Sederhana ---")
print(paste("Koefisien Korelasi Spearman (ρ) =", round(cor_value, 3)))

# Interpretasi kekuatan hubungan
if (abs(cor_value) >= 0.7) {
  strength <- "kuat"
} else if (abs(cor_value) >= 0.4) {
  strength <- "sedang"
} else if (abs(cor_value) >= 0.1) {
  strength <- "lemah"
} else {
  strength <- "sangat lemah atau tidak ada"
}
print(strength)

# Interpretasi arah hubungan
if (cor_value > 0) {
  direction <- "positif"
} else if (cor_value < 0) {
  direction <- "negatif"
} else {
  direction <- "tidak ada arah"
}

print(paste(
  "Ini menunjukkan adanya korelasi",
  direction,
  strength,
  "antara",
  var_x,
  "dan",
  var_y,
  "."
))

# Interpretasi signifikansi
if (p_value <= 0.05) {
  print(paste("p-value =", round(p_value, 5), "adalah signifikan secara statistik (<= 0.05), 
              sehingga kita yakin ada korelasi nyata di populasi."))
} else {
  print(paste("p-value =", round(p_value, 5), "tidak signifikan secara statistik (> 0.05), 
              sehingga korelasi yang teramati bisa jadi hanya kebetulan."))
}

#============SELESAI================