# Tugas Analisis Statistik: Deskriptif, Korelasi, dan Regresi

## 1. Informasi Penyusun

- **Nama:** `Made Artika Sari Dewi`
- **NIM:** `2515091054`
- **Program Studi:** `Sisitem Informasi`
- **Mata Kuliah:** Statistika dan Probabilitas

---

## 2. Deskripsi Proyek
Projek ini menggunakan dataset pelanggan yang memuat informasi menganai karakteristik ekonomi dan nilai pelanggan. Dataset tersebut mencakup beberapa variabel utama, yaitu Pendapatan Tahunan, Nilai Pelanggan, dan Tingkat Churn
Analisis diawali dengan statistik deskriptif untuk memggambarkan karakteristik data, meliputi perhitungan mean, median, modus serta sebaran data pada setiap variabel. Selanjutnya, dilakukan analisis korelasi untuk menguji hubungan antara Pendapatan Tahunan dan Nilai Pelanggan. Pada tahap akhir, digunakan analisis regresi untuk menganalisis pengaruh Pendapatan Tahunan dan Tingkat Churn terhadap Nilai Pelanggan

---

## 3. Struktur Proyek

Proyek ini diorganisir ke dalam beberapa folder:
- `/data`: Berisi dataset mentah yang digunakan untuk analisis.
- `/scripts`: Berisi semua skrip R yang digunakan dalam analisis, diurutkan berdasarkan alur kerja.
- `/results`: Berisi output dari analisis, seperti plot, gambar, atau tabel ringkasan.

---

## 4. Cara Menjalankan Analisis

Untuk mereproduksi hasil analisis ini, ikuti langkah-langkah berikut:
1. Pastikan Anda memiliki R dan RStudio terinstal.
2. Buka proyek R ini di RStudio.
3. Instal paket yang diperlukan dengan menjalankan perintah berikut di konsol R:
   ```R
   # install.packages(c("tidyverse", "corrplot", "knitr"))
   ```
4. Jalankan skrip di dalam folder `/scripts` secara berurutan, mulai dari `01_data_preparation.R` hingga `05_analisis_regresi.R`.

---

## 5. Hasil dan Interpretasi

Di bagian ini, mahasiswa diharapkan untuk menyajikan dan menginterpretasikan hasil dari setiap tahap analisis.

### 5.1. Statistik Deskriptif
- **Ukuran Pemusatan (Mean, Median, Modus):**
  - ### Tabel Statistik Deskriptif
| Variabel                             |    Mean     |    Median   |    Modus   |
|--------------------------------------|-------------|-------------|------------|
| Pendapatan Tahunan                   | 2908.16     | 2756.50     | 187.00     |
| Biaya Akuisisi Pelanggan (Juta IDR)  | 3050.53     | 2911.50     | 321.00     |
| Nilai Pelanggan (Juta IDR)           | 9098.98     | 8682.50     | 1011.00    |
| Tingkat Churn (%)                    | -14.79      | -14.39      | 13.55      |

  - **Interpretasi:**
  - Berdasarkan hasil statistik deskriptif, rata-rata **pendapatan tahunan** pelanggan sebesar 2908.16 dengan nilai median 2756.50 dan modus 187.00. Nilai mean yang lebih besar dibandingkan median menunjukkan bahwa distribusi pendapatan tahunan cenderung **miring ke kanan**, yang mengindikasikan adanya sebagian kecil pelanggan dengan pendapatan yang relatif lebih tinggi. Perbedaan nilai modus yang cukup jauh dari mean dan median menunjukkan bahwa sebagian besar pelanggan memiliki pendapatan pada tingkat yang lebih rendah dibandingkan rata-ratanya.
- Pada variabel **biaya akuisisi pelanggan**, diperoleh nilai rata-rata sebesar 3050.53, median 2911.50, dan modus 321.00. Perbedaan antara mean dan median yang relatif kecil mengindikasikan bahwa sebaran biaya akuisisi pelanggan **cukup merata**, meskipun nilai modus yang lebih rendah menunjukkan bahwa biaya akuisisi yang paling sering muncul berada pada kisaran yang lebih kecil dibandingkan nilai rata-ratanya.
- Untuk variabel **nilai pelanggan**, rata-rata tercatat sebesar 9098.98, dengan median 8682.50 dan modus 1011.00. Nilai mean yang lebih tinggi daripada median mengindikasikan bahwa distribusi nilai pelanggan cenderung **condong ke kanan**, yang menunjukkan keberadaan pelanggan dengan nilai yang sangat tinggi sehingga meningkatkan nilai rata-rata keseluruhan.
- Sementara itu, pada variabel **tingkat churn**, diperoleh nilai mean sebesar -14.79, median -14.39, dan modus 13.55. Nilai mean dan median yang relatif berdekatan menunjukkan bahwa secara umum tingkat churn pelanggan berada pada kisaran yang **relatif stabil**. Perbedaan tanda antara nilai modus dan nilai rata-rata mengindikasikan adanya variasi perilaku churn di antara pelanggan, yang dapat dipengaruhi oleh perbedaan karakteristik atau segmen pelanggan tertentu.

- **Ukuran Sebaran (Standar Deviasi, Range, Kuartil):**
  - - ### Tabel Ukuran Sebaran
    - ### Tabel 5.2 Ukuran Sebaran dan Kuartil Variabel Penelitian

| Variabel                             | Std. Dev | Min   | Q1      | Median  | Q3      |  Max    |
|--------------------------------------|----------|-------|---------|---------|---------|---------|
| Pendapatan Tahunan                   | 2064.93  | 10.00 | 893.80  | 2756.50 | 4706.20 | 6689.00 |
| Biaya Akuisisi Pelanggan             | 2106.48  | 38.00 | 964.50  | 2911.50 | 4894.25 | 6877.00 |
| Nilai Pelanggan                      | 6284.27  | 134.00| 3006.50 | 8682.50 |14614.25 |20546.00 |
| Tingkat Churn (%)                    | 20.02    | -50.03| -32.21  | -14.39  | 3.43    | 15.78   |

  - **Interpretasi**:
  - Nilai standar deviasi **pendapatan tahunan** sebesar 2064.93 menunjukkan bahwa variasi pendapatan pelanggan **tergolong tinggi**. Rentang nilai yang cukup lebar, yaitu dari 10 hingga 6689, mengindikasikan adanya perbedaan pendapatan yang signifikan antar pelanggan. Nilai kuartil pertama (Q1) sebesar 893.80 dan kuartil ketiga (Q3) sebesar 4706.20 menunjukkan bahwa 50% pelanggan memiliki pendapatan tahunan pada kisaran tersebut. Secara keseluruhan, sebaran data pendapatan tahunan mencerminkan karakteristik **pelanggan yang heterogen**.
- Pada variabel **biaya akuisisi pelanggan**, nilai standar deviasi sebesar 2106.48 menunjukkan adanya variasi biaya yang **cukup besar**. Rentang nilai antara 38.00 hingga 6877.00 mengindikasikan perbedaan biaya akuisisi yang lebar antar pelanggan. Nilai kuartil pertama (Q1) sebesar 964.50 dan kuartil ketiga (Q3) sebesar 4894.25 menunjukkan bahwa sebagian besar biaya akuisisi pelanggan berada pada kisaran tersebut, yang mencerminkan variasi strategi akuisisi pada segmen **pelanggan yang berbeda**.
- Untuk variabel **nilai pelanggan**, nilai standar deviasi sebesar 6284.27 menunjukkan tingkat variasi data yang sangat tinggi. Rentang nilai yang luas, yaitu dari 134.00 hingga 20546.00, mengindikasikan perbedaan nilai pelanggan yang signifikan. Nilai kuartil pertama (Q1) sebesar 3006.50 dan kuartil ketiga (Q3) sebesar 14614.25 menunjukkan bahwa 50% pelanggan memiliki nilai pelanggan pada rentang tersebut, yang menandakan adanya kelompok pelanggan bernilai tinggi yang memengaruhi distribusi data.
- Sementara itu, pada variabel **tingkat churn**, nilai standar deviasi sebesar 20.02 menunjukkan adanya variasi perilaku pelanggan yang cukup besar. Rentang nilai antara -50.03 hingga 15.78 mengindikasikan perbedaan tingkat churn yang mencolok antar pelanggan. Nilai kuartil pertama (Q1) sebesar -32.21 dan kuartil ketiga (Q3) sebesar 3.43 menunjukkan bahwa sebagian besar nilai churn berada pada kisaran tersebut. Secara keseluruhan, sebaran data tingkat churn mencerminkan adanya perbedaan pola retensi pelanggan di dalam dataset.
- **Visualisasi (Histogram/Boxplot):**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Jelaskan wawasan apa yang Anda dapatkan dari bentuk distribusi data.

### 5.2. Uji Normalitas
- **Hasil Uji Shapiro-Wilk:**
  - *Nilai p-value...*
  - *Interpretasi:* Apakah data Anda terdistribusi normal berdasarkan hasil uji? Apa implikasinya?
- **Plot Q-Q:**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Apakah titik-titik data mengikuti garis lurus? Apa artinya?

### 5.3. Analisis Korelasi
- **Nilai Koefisien Korelasi:**
  - *Nilai r...*
  - *Interpretasi:* Seberapa kuat dan apa arah hubungan antara dua variabel yang Anda uji? (misalnya, korelasi positif kuat, negatif lemah, atau tidak ada korelasi).
- **Visualisasi (Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Apakah pola pada scatter plot mendukung hasil koefisien korelasi?

### 5.4. Analisis Regresi
- **Model Regresi:**
  - *Persamaan regresi: Y = b0 + b1*X*
  - *Interpretasi:* Jelaskan arti dari koefisien intercept (b0) dan slope (b1) dalam konteks data Anda.
- **Evaluasi Model (R-squared):**
  - *Nilai R-squared...*
  - *Interpretasi:* Berapa persen variasi dari variabel dependen yang dapat dijelaskan oleh model regresi Anda?
- **Visualisasi (Garis Regresi pada Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Jelaskan bagaimana garis regresi merepresentasikan hubungan antara variabel.

---

## 6. Kesimpulan

Rangkum temuan utama dari analisis Anda dalam beberapa kalimat. Apa wawasan paling penting yang Anda peroleh?
