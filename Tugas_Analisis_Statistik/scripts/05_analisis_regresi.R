# =================================================================
# SKRIP 5: ANALISIS REGRESI LINEAR SEDERHANA
# =================================================================
# Persiapan
# -----------------------------------------------------------------
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

var_dependen <- "Tingkat_Churn_Persen"
var_independen_x1 <- "Pendapatan_Tahunan_Miliar_IDR"
var_independen_x2 <- "Nilai_Pelanggan_Juta_IDR"

if(
  !var_dependen %in% names(data_bersih) ||
  !var_independen_x1 %in% names(data_bersih) ||
  !var_independen_x2 %in% names(data_bersih)
) {
  stop(
    paste(
      "Satu atau lebih kolom tidak ditemukan:",
      var_dependen, ",",
      var_independen_x1, ",",
      var_independen_x2,
      ". Periksa kembali nama kolom pada file 05_analisis_regresi.R"
    )
  )
}

# -----------------------------------------------------------------
# Membangun Model Regresi Linear
# -----------------------------------------------------------------
model_regresi <- lm(
  Tingkat_Churn_Persen ~ Pendapatan_Tahunan_Miliar_IDR + Nilai_Pelanggan_Juta_IDR,
  data = data_bersih)

# -----------------------------------------------------------------
# Melihat dan Menginterpretasikan Hasil Model
# -----------------------------------------------------------------
summary_model <- summary(model_regresi)

print("--- Ringkasan Model Regresi Linear ---")
print(summary_model)

print("--- Interpretasi Penting dari Model ---")

# A. Koefisien (Coefficients)
coef_vals <- coef(model_regresi)

b0 <- coef_vals[1]
b1 <- coef_vals[2]  # Pendapatan Tahunan
b2 <- coef_vals[3]  # Nilai Pelanggan

print(paste(
  "1. Persamaan Model:",
  var_dependen, "=",
  round(b0, 2), "+",
  round(b1, 6), "*", var_independen_x1, "+",
  round(b2, 6), "*", var_independen_x2
))

print(paste(
  "- Intercept (b0):", round(b0, 2),
  "→ Nilai", var_dependen, "saat semua variabel independen bernilai 0."
))

print(paste(
  "- Koefisien", var_independen_x1, "(b1):",
  round(b1, 6),
  "→ Pengaruh", var_independen_x1,
  "terhadap", var_dependen,
  "dengan variabel lain konstan."
))

print(paste(
  "- Koefisien", var_independen_x2, "(b2):",
  round(b2, 6),
  "→ Pengaruh", var_independen_x2,
  "terhadap", var_dependen,
  "dengan variabel lain konstan."
))


# B. R-squared (Koefisien Determinasi)
adj_r_squared <- summary_model$adj.r.squared

print(paste(
  "2. Adjusted R-squared =",
  round(adj_r_squared, 3),
  "atau",
  round(adj_r_squared * 100, 1),
  "%"
))

print(paste(
  "   - Artinya,",
  round(adj_r_squared * 100, 1),
  "% variasi pada", var_dependen,
  "dapat dijelaskan secara simultan oleh",
  var_independen_x1, "dan", var_independen_x2,
  "melalui model regresi ini."
))

# -----------------------------------------------------------------
# Visualisasi Garis Regresi
# -----------------------------------------------------------------
# ====ggplot y (Tingkat_Churn_Persen) ~ x1 (Pendapatan_Tahunan_Miliar_IDR)============
plot_regresi_x1 <- ggplot(data_bersih, aes_string(x = var_independen_x1, y = var_dependen)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") + # `se = TRUE` menampilkan confidence interval
  labs(
    title = "Garis Regresi Linear",
    subtitle = paste0(
      "Model: ", var_dependen, " ~ ", var_independen_x1, "\n",
      "Adj. R-squared = ", round(adj_r_squared, 3)
    ),
    x = var_independen_x1,
    y = var_dependen
  ) +
  theme_minimal()

print(plot_regresi_x1)

# Menyimpan plot regresi ke folder 'results'
ggsave(
  filename = paste0("D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/plot_regresi_", var_independen_x1, "_vs_", var_dependen, ".png"),
  plot = plot_regresi,
  width = 8,
  height = 6
)
print(paste("Plot regresi disimpan di folder 'results'."))

# ====ggplot y (Tingkat_Churn_Persen) ~ x1 (Nilai_Pelanggan_Juta_IDR)============
plot_regresi_x2 <- ggplot(data_bersih, aes_string(x = var_independen_x2, y = var_dependen)) +
  geom_point(alpha = 0.6, color = "brown") +
  geom_smooth(method = "lm", se = TRUE, color = "purple") + # `se = TRUE` menampilkan confidence interval
  labs(
    title = "Garis Regresi Linear",
    subtitle = paste0(
      "Model: ", var_dependen, " ~ ", var_independen_x2, "\n",
      "Adj. R-squared = ", round(adj_r_squared, 3)
    ),
    x = var_independen_x2,
    y = var_dependen
  ) +
  theme_minimal()

print(plot_regresi_x2)

# Menyimpan plot regresi ke folder 'results'
ggsave(
  filename = paste0("D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/plot_regresi_", var_independen_x2, "_vs_", var_dependen, ".png"),
  plot = plot_regresi,
  width = 8,
  height = 6
)
print(paste("Plot regresi disimpan di folder 'results'."))

# -----------------------------------------------------------------
# TAMBAHAN : Saya membuat avPlots
# -----------------------------------------------------------------
library (car)
model_regresi <- lm(
  Tingkat_Churn_Persen ~ 
    Pendapatan_Tahunan_Miliar_IDR + #regresi berganda
    Nilai_Pelanggan_Juta_IDR,
  data = data_bersih
)
summary_model <- summary(model_regresi)
print(summary_model)

avPlots(
  model_regresi,
  main = "Added Variable Plot (Efek Parsial Variabel Independen)"
)

#menyimpan gambar
png(
  filename = "D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/avplots_regresi_churn.png",
  width = 800,
  height = 600
)
avPlots(
  model_regresi,
  main = "Added Variable Plot (Efek Parsial Variabel Independen)"
)
dev.off()
print("Added Variable Plot berhasil disimpan di folder 'results'.")
#============SELESAI================
