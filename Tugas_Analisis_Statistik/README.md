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

**Interpretasi:**
  - Berdasarkan hasil statistik deskriptif, rata-rata **pendapatan tahunan** pelanggan sebesar 2908.16 dengan nilai median 2756.50 dan modus 187.00. Nilai mean yang lebih besar dibandingkan median menunjukkan bahwa distribusi pendapatan tahunan cenderung **miring ke kanan**, yang mengindikasikan adanya sebagian kecil pelanggan dengan pendapatan yang relatif lebih tinggi. Perbedaan nilai modus yang cukup jauh dari mean dan median menunjukkan bahwa sebagian besar pelanggan memiliki pendapatan pada tingkat yang lebih rendah dibandingkan rata-ratanya.
- Pada variabel **biaya akuisisi pelanggan**, diperoleh nilai rata-rata sebesar 3050.53, median 2911.50, dan modus 321.00. Perbedaan antara mean dan median yang relatif kecil mengindikasikan bahwa sebaran biaya akuisisi pelanggan **cukup merata**, meskipun nilai modus yang lebih rendah menunjukkan bahwa biaya akuisisi yang paling sering muncul berada pada kisaran yang lebih kecil dibandingkan nilai rata-ratanya.
- Untuk variabel **nilai pelanggan**, rata-rata tercatat sebesar 9098.98, dengan median 8682.50 dan modus 1011.00. Nilai mean yang lebih tinggi daripada median mengindikasikan bahwa distribusi nilai pelanggan cenderung **condong ke kanan**, yang menunjukkan keberadaan pelanggan dengan nilai yang sangat tinggi sehingga meningkatkan nilai rata-rata keseluruhan.
- Sementara itu, pada variabel **tingkat churn**, diperoleh nilai mean sebesar -14.79, median -14.39, dan modus 13.55. Nilai mean dan median yang relatif berdekatan menunjukkan bahwa secara umum tingkat churn pelanggan berada pada kisaran yang **relatif stabil**. Perbedaan tanda antara nilai modus dan nilai rata-rata mengindikasikan adanya variasi perilaku churn di antara pelanggan, yang dapat dipengaruhi oleh perbedaan karakteristik atau segmen pelanggan tertentu.

- **Ukuran Sebaran (Standar Deviasi, Range, Kuartil):**
 - ### Tabel Ukuran Sebaran
| Variabel                             | Std. Dev | Min   | Q1      | Median  | Q3      |  Max    |
|--------------------------------------|----------|-------|---------|---------|---------|---------|
| Pendapatan Tahunan                   | 2064.93  | 10.00 | 893.80  | 2756.50 | 4706.20 | 6689.00 |
| Biaya Akuisisi Pelanggan             | 2106.48  | 38.00 | 964.50  | 2911.50 | 4894.25 | 6877.00 |
| Nilai Pelanggan                      | 6284.27  | 134.00| 3006.50 | 8682.50 |14614.25 |20546.00 |
| Tingkat Churn (%)                    | 20.02    | -50.03| -32.21  | -14.39  | 3.43    | 15.78   |

**Interpretasi**:
  - Nilai standar deviasi **pendapatan tahunan** sebesar 2064.93 menunjukkan bahwa variasi pendapatan pelanggan **tergolong tinggi**. Rentang nilai yang cukup lebar, yaitu dari 10 hingga 6689, mengindikasikan adanya perbedaan pendapatan yang signifikan antar pelanggan. Nilai kuartil pertama (Q1) sebesar 893.80 dan kuartil ketiga (Q3) sebesar 4706.20 menunjukkan bahwa 50% pelanggan memiliki pendapatan tahunan pada kisaran tersebut. Secara keseluruhan, sebaran data pendapatan tahunan mencerminkan karakteristik **pelanggan yang heterogen**.
- Pada variabel **biaya akuisisi pelanggan**, nilai standar deviasi sebesar 2106.48 menunjukkan adanya variasi biaya yang **cukup besar**. Rentang nilai antara 38.00 hingga 6877.00 mengindikasikan perbedaan biaya akuisisi yang lebar antar pelanggan. Nilai kuartil pertama (Q1) sebesar 964.50 dan kuartil ketiga (Q3) sebesar 4894.25 menunjukkan bahwa sebagian besar biaya akuisisi pelanggan berada pada kisaran tersebut, yang mencerminkan variasi strategi akuisisi pada segmen **pelanggan yang berbeda**.
- Untuk variabel **nilai pelanggan**, nilai standar deviasi sebesar 6284.27 menunjukkan tingkat variasi data yang sangat tinggi. Rentang nilai yang luas, yaitu dari 134.00 hingga 20546.00, mengindikasikan perbedaan nilai pelanggan yang signifikan. Nilai kuartil pertama (Q1) sebesar 3006.50 dan kuartil ketiga (Q3) sebesar 14614.25 menunjukkan bahwa 50% pelanggan memiliki nilai pelanggan pada rentang tersebut, yang menandakan adanya kelompok pelanggan bernilai tinggi yang memengaruhi distribusi data.
- Sementara itu, pada variabel **tingkat churn**, nilai standar deviasi sebesar 20.02 menunjukkan adanya variasi perilaku pelanggan yang cukup besar. Rentang nilai antara -50.03 hingga 15.78 mengindikasikan perbedaan tingkat churn yang mencolok antar pelanggan. Nilai kuartil pertama (Q1) sebesar -32.21 dan kuartil ketiga (Q3) sebesar 3.43 menunjukkan bahwa sebagian besar nilai churn berada pada kisaran tersebut. Secara keseluruhan, sebaran data tingkat churn mencerminkan adanya perbedaan pola retensi pelanggan di dalam dataset.
- **Visualisasi (Histogram & Boxplot):**
  - ### Histogram Pendapatan Tahunan (Miliar IDR)
![Histogram Pendapatan Tahunan](results/histogram_Pendapatan_Tahunan_Miliar_IDR.png)
**Interpretasi:**
 - Berdasarkan **histogram Pendapatan Tahunan** (dalam miliar IDR), distribusi data terlihat cenderung miring ke kanan. Hal ini menunjukkan bahwa sebagian besar perusahaan memiliki pendapatan tahunan dengan nilai rendah hingga menengah, sementara itu hanya sebagian kacil perusahaan yang memiliki pendapatan yang sangat kecil. Garis merah putus - putus pada histogram menunjukkan nilai mean ebesar 2908,16 miliar IDR berada lebih ke kanan dari konsentrasi data, yang mengindikasikan adanya pengaruh nilai pendapatan tinggi terhadapt rata - rata. Sebaran data yang cukup lebar menandakan bahwa adanya variasi tahunan yang tinggi antar perusahaan. Sehingga pada variabel pendapatan tahunan digunakan sebagai variabel utama dalam analisis statistik deskriptif, karena mampu merepresentasikan karakteristik distribusi dan sebaran data secara jelas.
 - 
    - ### Boxplot Pendapatan Tahunan (Miliar IDR)
![Boxplot Pendapatan Tahunan](results/boxplot_Pendapatan_Tahunan_Miliar_IDR.png)
**Intepretasi:**
- Berdasarkan boxplot, dapat diketahui bahwa pendapatan tahunan memiliki variasi data yang cukup besar. Nilai minimum pendapatan tercatat sebesar 10 miliar IDR, sedangkan nilai maksimum mencapai 6.689 miliar IDR, menunjukkan **rentang data yang sangat lebar**.
- Median pendapatan tahunan berada pada nilai 2.756,50 miliar IDR, yang berarti separuh dari observasi memiliki pendapatan di bawah nilai tersebut dan separuh lainnya di atasnya. Kuartil bawah (Q1) sebesar 893,80 miliar IDR dan kuartil atas (Q3) sebesar 4.706,20 miliar IDR, sehingga rentang antar **kuartil (IQR) tergolong besar**. Hal ini mengindikasikan bahwa sebaran pendapatan antar objek pengamatan cukup heterogen. Posisi median yang relatif lebih dekat ke kuartil bawah serta whisker atas yang lebih panjang dibandingkan whisker bawah menunjukkan bahwa distribusi data cenderung miring ke kanan (positively skewed). Artinya, terdapat beberapa nilai pendapatan yang sangat tinggi yang menarik distribusi ke arah kanan.
- Standar deviasi sebesar 2.064,93 miliar IDR memperkuat temuan ini, karena menunjukkan tingkat penyebaran data yang tinggi terhadap nilai rata-ratanya. Tidak tampak adanya outlier ekstrem yang ditandai secara visual, namun variasi data tetap besar. 

### 5.2. Uji Normalitas
- Ringkasan Hasil Uji Shapiro-Wilk:
_Uji Normalitas dilakukan terhadap Tiga Variabel,_ yaitu P**endapatan Tahunan, Nilai Pelanggan dan Tingkat Churn**. Pengujian ini bertujuan untuk memastikan pemenuhan asumsi distribusi data sebelum dilakukan **analisis korelasi** dan **analisis regresi**.
**1. Pendapatan Tahunan**
Statistik W : 0.92753
p-value : 2.2e-16
Keputusan : Tidak terdistribusi normal
**2. Nilai Pelanggan**
Statistik W : 0.92792
p-value : < 2.2e-16
Keputusan : Tidak terdistribusi normal
**3. Tingkat Churn (%)**
Statistik W : 0.94267
p-value : 3.942e-15
Keputusan : Tidak terdistribusi normal
  - **Interpretasi:**
   Berdasarkan hasil uji Shapiro–Wilk, seluruh variabel yang dianalisis, yaitu Pendapatan Tahunan, Nilai Pelanggan, dan Tingkat Churn, memiliki nilai p-value ≤ 0,05. Hal ini menunjukkan bahwa ketiga variabel tersebut tidak terdistribusi normal. Oleh karena itu, analisis hubungan antar variabel dilakukan menggunakan metode non-parametrik, yaitu korelasi Spearman, yang tidak mensyaratkan asumsi normalitas data.
- **Plot Q-Q:**
  - ![Q–Q Plot Pendapatan Tahunan](results/qqplot_Pendapatan_Tahunan_Miliar_IDR.png)
  - *Interpretasi:*
- Titik-titik data tidak mengikuti garis lurus diagonal (garis merah) secara konsisten.
- Pada bagian kuantil rendah dan kuantil tinggi, titik-titik terlihat menyimpang cukup jauh dari garis normal.
- Pola lengkungan (tidak linear) menunjukkan bahwa distribusi data tidak simetris dan cenderung tidak normal.
Berdasarkan Q–Q plot, data Pendapatan Tahunan tidak terdistribusi normal, karena titik-titik data tidak mengikuti garis distribusi normal.

### 5.3. Analisis Korelasi
- **Nilai Koefisien Korelasi:**
  - Metode korelasi: Spearman
Koefisien korelasi (ρ): 0.706
p-value: < 0.05
  - **Interpretasi:**
Berdasarkan hasil analisis korelasi menggunakan **metode Spearman**, diperoleh nilai koefisien korelasi (ρ) sebesar 0,706 dengan nilai p-value < 0,05. Hasil ini menunjukkan bahwa terdapat hubungan yang positif dan kuat antara Pendapatan Tahunan dan Nilai Pelanggan. Artinya, peningkatan pendapatan tahunan cenderung diikuti oleh peningkatan nilai pelanggan. Hubungan tersebut bersifat signifikan secara statistik, sehingga dapat disimpulkan bahwa pendapatan tahunan memiliki keterkaitan yang bermakna dengan nilai pelanggan dalam data yang dianalisis.
- **Visualisasi (Scatter Plot):**
  - ![Scatter Plot Pendapatan Tahunan vs Nilai Pelanggan](results/scatterplot_Pendapatan_Tahunan_Miliar_IDR_vs_Nilai_Pelanggan_Juta_IDR.png)
  - **Interpretasi**:
Pola sebaran pada scatter plot menunjukkan kecenderungan hubungan positif antara Pendapatan Tahunan dan Nilai Pelanggan. Meskipun data tidak sepenuhnya membentuk hubungan linear yang sempurna dan terdapat variasi serta outlier, arah tren yang meningkat secara konsisten mendukung hasil koefisien korelasi Spearman sebesar 0,706 yang menunjukkan hubungan positif dan kuat.

### 5.4. Analisis Regresi
- **Model Regresi:**
  -  **Y = b0 + b1X₁ + b2X₂**
  - Keterangan :
  Y = Y = Tingkat_Churn_Persen
  X₁ = Pendapatan_Tahunan_Miliar_IDR
  X₂ = Nilai_Pelanggan_Juta_IDR
- Dari bagian Coefficients:
Intercept (b₀) = 13,87
Pendapatan_Tahunan_Miliar_IDR (b₁) = -0,004967
Nilai_Pelanggan_Juta_IDR (b₂) = -0,001564
- *Persamaan regresi:*
- Tingkat Churn (%) = 13,87 − 0,004967(Pendapatan Tahunan) − 0,001564(Nilai Pelanggan)
  - **Interpretasi:**
   Berdasarkan hasil **Analisis Regresi Berganda** dengan variabel dependen **Tingkat_Churn_Persen** serta variabel independen **Pendapatan_Tahunan_Miliar_IDR** dan **Nilai_Pelanggan_Juta_IDR**, diperoleh intepretasi koefisien sebagai berikut:
- **Intercept (b0)**
Nilai intercept (b0) sebesar **13,87** menunjukkan bahwa ketika pendapatan tahunan dan nilai pelanggan bernilai nol (0), maka tingkat churn pelanggan diperkirakan sebesar **13,87%**. Nilai ini merupakan titik awal model dan bersifat teoritis, karena dalam praktik kondisi seluruh variabel independen bernilai nol jarang terjadi
- **Slope (b1) - Pendapatan Tahunan**
Koefisien slope (b1) untuk variabel Pendapatan_Tahunan_Miliar_IDR sebesar -0,004967 menunjukkan bahwa setiap peningkatan 1 miliar rupiah pendapatn tahunan akan menurunkan tingkat churn pelanggan sebesar sekitar 0,005% dengan nilai pelanggan dianggap **konstan**. Tanda negatif pada koefisien menunjukkan bahwa hubungan yang berlawanan antara pendapatan tahunan dan tingkat churn.
- **Slope (b2) - Nilai Pelanggan**
Koefisien slope (b2) untuk variabel Nilai_Pelanggan_Juta_IDR sebesar -0,001564 menunjukkan bahwa setiap peningkatan 1 juta rupiah nilai pelanggan akan menurunkan tingkat churn pelanggan sebesar sekitar 0,0016% dengan pendapatan tahunan dianggap **konstan**. Hal ini menunjukkan bahwa semakin tinggi nilai pelanggan, maka kecenderungan pelanggan untuk berhenti (churn) semakin rendah.

- **Evaluasi Model (R-squared):**
  - *Nilai R-squared* : **Adjusted R-squared = 0.869 atau 86.9 %**
  - **Interpretasi**:
Berdasarkan hasil analisis regresi, diperoleh nilai Adjusted R-squared sebesar **0,869**. Hal ini menunjukkan bahwa sebanyak **86,9%** variasi pada variabel dependen, yaitu **Tingkat_Churn_Persen**, dapat dijelaskan oleh model regresi yang terdiri dari **variabel Pendapatan_Tahunan_Miliar_IDR**dan **Nilai_Pelanggan_Juta_IDR** secara simultan.
Sementara itu,**13,1% variasi sisanya dijelaskan oleh faktor lain di luar model regresi yang tidak diteliti dalam penelitian ini.**

- **Visualisasi (Garis Regresi pada Scatter Plot):**
- Analisis ini dilengkapi dengan **dua plot regresi linear** yang menunjukkan hubungan antara:
- Tingkat_Churn_Persen dan Pendapatan_Tahunan_Miliar_IDR  
- Tingkat_Churn_Persen dan Nilai_Pelanggan_Juta_IDR  
Selain itu, digunakan pula **Added-Variable Plots (AVPlots)** untuk mengevaluasi **pengaruh parsial** masing-masing variabel independen dalam model regresi linear berganda.
  - **Gambar 1 Plot Tingkat_Churn_Persen dan Pendapatan_Tahunan_Miliar_IDR**
 - ![Plot Regresi Pendapatan Tahunan vs Tingkat Churn](results/plot_regresi_Pendapatan_Tahunan_Miliar_IDR_vs_Tingkat_Churn_Persenn.png)
 - **Intepretasi: Plot Tingkat_Churn_Persen dan Pendapatan_Tahunan_Miliar_IDR**
 Plot regresi linear ini menunjukkan hubungan antara Pendapatan Tahunan (dalam miliar IDR) dengan Tingkat Churn (dalam persen). Titik-titik biru pada grafik merepresentasikan data aktual, sedangkan garis merah menunjukkan garis regresi linear yang menggambarkan tren hubungan antara kedua variabel tersebut.
Berdasarkan grafik, terlihat bahwa garis regresi memiliki kemiringan negatif, yang berarti terdapat hubungan terbalik antara pendapatan tahunan dan tingkat churn. Dengan kata lain, semakin tinggi pendapatan tahunan, maka tingkat churn cenderung semakin rendah. Hal ini menunjukkan bahwa entitas dengan pendapatan yang lebih besar memiliki kecenderungan lebih kecil untuk kehilangan pelanggan.
Nilai Adjusted R-squared sebesar 0,869 menunjukkan bahwa sekitar 86,9% variasi tingkat churn dapat dijelaskan oleh variabel pendapatan tahunan. Nilai ini tergolong tinggi, sehingga model regresi yang digunakan dapat dikatakan cukup baik dan kuat dalam menjelaskan hubungan antara pendapatan dan churn.
Secara keseluruhan, grafik ini mengindikasikan bahwa pendapatan tahunan merupakan faktor yang berpengaruh signifikan terhadap tingkat churn, meskipun faktor lain di luar model tetap mungkin memengaruhi nilai churn.
 - **Gambar 2 Plot Tingkat_Churn_Persen dan Nilai_Pelanggan_Juta_IDR**
- ![Plot Regresi Nilai Pelanggan vs Tingkat Churn](results/scatterplot_Nilai_Pelanggan_Juta_IDR_vs_Tingkat_Churn_Persen.png)

- **Intepretasi:**
  Plot regresi linear ini menunjukkan hubungan antara Nilai Pelanggan (dalam juta IDR) dengan Tingkat Churn (dalam persen). Titik-titik pada grafik merepresentasikan data aktual, sedangkan garis regresi menunjukkan arah dan pola hubungan linear antara kedua variabel tersebut.
Dari grafik terlihat bahwa garis regresi memiliki kemiringan negatif, yang menandakan adanya hubungan terbalik antara nilai pelanggan dan tingkat churn. Artinya, semakin tinggi nilai pelanggan, maka tingkat churn cenderung semakin rendah. Pelanggan dengan nilai yang lebih besar cenderung lebih loyal dan tidak mudah berhenti.
Nilai Adjusted R-squared sebesar 0,869 menunjukkan bahwa sekitar 86,9% variasi tingkat churn dapat dijelaskan oleh variabel nilai pelanggan. Nilai ini tergolong tinggi, sehingga model regresi yang digunakan memiliki kemampuan yang baik dalam menjelaskan hubungan antara nilai pelanggan dan churn.
Meskipun terdapat beberapa data yang menyebar cukup jauh dari garis regresi, pola keseluruhan tetap menunjukkan tren yang konsisten. Hal ini mengindikasikan bahwa nilai pelanggan merupakan salah satu faktor penting dalam memengaruhi tingkat churn, meskipun faktor lain di luar model juga dapat berperan.

**Visualisasi (Gambar 3 Regresi pada avPlots):**
![AVPlots Regresi Churn](results/avplots_regresi_churn.png)
AVPlots digunakan untuk mengevaluasi pengaruh parsial masing-masing variabel independen terhadap Tingkat_Churn_Persen.

- **Interpretasi : avPlots**
Added Variable Plot (AV Plot) ini digunakan untuk melihat pengaruh masing-masing variabel independen terhadap tingkat churn, dengan asumsi variabel independen lainnya sudah dikendalikan (dianggap konstan). Pada grafik ini terdapat dua plot, yaitu untuk Pendapatan Tahunan dan Nilai Pelanggan.
**1. AV Plot Pendapatan Tahunan**
Plot sebelah kiri menunjukkan hubungan antara Pendapatan Tahunan (setelah mengontrol variabel lain) dengan Tingkat Churn. Terlihat bahwa garis tren memiliki kemiringan negatif, yang berarti bahwa ketika pendapatan tahunan meningkat, tingkat churn cenderung menurun, meskipun pengaruh variabel lain telah diperhitungkan.
Sebaran titik yang relatif mengikuti arah garis tren menunjukkan bahwa pendapatan tahunan memberikan kontribusi nyata dalam menjelaskan perubahan tingkat churn.
**2. AV Plot Nilai Pelanggan**
Plot sebelah kanan menggambarkan hubungan antara Nilai Pelanggan (setelah mengontrol variabel lain) dengan Tingkat Churn. Sama seperti plot sebelumnya, garis tren juga menunjukkan hubungan negatif. Artinya, semakin tinggi nilai pelanggan, maka tingkat churn cenderung semakin rendah, bahkan setelah pengaruh variabel pendapatan tahunan dikendalikan.
Pola titik yang cukup konsisten dengan garis tren menandakan bahwa nilai pelanggan juga memiliki pengaruh signifikan terhadap tingkat churn.
---

## 6. Kesimpulan

Rangkum temuan utama dari analisis Anda dalam beberapa kalimat. Apa wawasan paling penting yang Anda peroleh?
