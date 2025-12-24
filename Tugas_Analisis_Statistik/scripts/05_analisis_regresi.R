# =================================================================
# SKRIP 5: ANALISIS REGRESI LINEAR SEDERHANA
# =================================================================
# Langkah 0: Persiapan
# -----------------------------------------------------------------
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

var_dependen <- "Nilai_Pelanggan_Juta_IDR"
var_independen <- "Pendapatan_Tahunan_Miliar_IDR"

if(!var_dependen %in% names(data_bersih) || !var_independen %in% names(data_bersih)) {
  stop(paste("Satu atau kedua kolom ('", var_dependen, "', '", var_independen, "') tidak ditemukan. Periksa kembali nama kolom pada file 05_analisis_regresi.R"))
}

# -----------------------------------------------------------------
# Langkah 1: Membangun Model Regresi Linear
# -----------------------------------------------------------------
model_regresi <- lm(as.formula(paste("Nilai_Pelanggan_Juta_IDR", "~", "Pendapatan_Tahunan_Miliar_IDR")), data = data_bersih)

# -----------------------------------------------------------------
# Langkah 2: Melihat dan Menginterpretasikan Hasil Model
# -----------------------------------------------------------------
summary_model <- summary(model_regresi)

print("--- Ringkasan Model Regresi Linear ---")
print(summary_model)

print("--- Interpretasi Penting dari Model ---")

# A. Koefisien (Coefficients)
intercept_val <- coef(model_regresi)[1]
slope_val <- coef(model_regresi)[2]

print(paste("1. Persamaan Model: ", var_dependen, " = ", round(intercept_val, 2), " + ", round(slope_val, 2), " * ", var_independen))
print(paste("   - Intercept (b0) =", round(intercept_val, 2), "-> Nilai prediksi", var_dependen, "ketika", var_independen, "adalah 0."))
print(paste("   - Slope (b1) =", round(slope_val, 2), "-> Setiap kenaikan 1 unit pada", var_independen, ", diprediksi akan mengubah", var_dependen, "sebesar", round(slope_val, 2), "unit."))

# B. R-squared (Koefisien Determinasi)
adj_r_squared <- summary_model$adj.r.squared
print(paste("2. Adjusted R-squared =", round(adj_r_squared, 3), "atau", round(adj_r_squared * 100, 1), "%" ))
print(paste("   - Artinya,", round(adj_r_squared * 100, 1), "% variasi pada", var_dependen, "dapat dijelaskan oleh", var_independen, "melalui model ini."))

# -----------------------------------------------------------------
# Langkah 3: Visualisasi Garis Regresi
# -----------------------------------------------------------------
plot_regresi <- ggplot(data_bersih, aes_string(x = var_independen, y = var_dependen)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") + # `se = TRUE` menampilkan confidence interval
  labs(
    title = "Garis Regresi Linear",
    subtitle = paste0(
      "Model: ", var_dependen, " ~ ", var_independen, "\n",
      "Adj. R-squared = ", round(adj_r_squared, 3)
    ),
    x = var_independen,
    y = var_dependen
  ) +
  theme_minimal()

print(plot_regresi)

# Menyimpan plot regresi ke folder 'results'
ggsave(
  filename = paste0("D:/SEMESTER 1/01-Statistik-Deskriptif/Tugas_Analisis_Statistik/results/plot_regresi_", var_independen, "_vs_", var_dependen, ".png"),
  plot = plot_regresi,
  width = 8,
  height = 6
)
print(paste("Plot regresi disimpan di folder 'results'."))

#============SELESAI================