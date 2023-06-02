# Nama  : Ghifari Maaliki Syafa Syuhada
# NRP   : 5025211158
# Kelas : Probabilitas dan Statistika C
#
# ---------- Modul 2 Praktikum Probabilitas dan Statistik 2023 ----------
# ------------ Estimasi Parameter, Uji Hipotesis, dan ANOVA -------------
  
# install.packages("BSDA")
library(BSDA)
  
# install.packages("mosaic")
library(mosaic)
  
# 3
n_bandung <- 20
n_bali <- 27
  
mean_bandung <- 3.64
mean_bali <- 2.79
  
sd_bandung <- 1.67
sd_bali <- 1.5
  
# a. H0 dan H1
# H0 = Rata-rata sama
# H1 = Rata-rata tidak sama
  
# b. Hitung sampel statistik
res <- tsum.test(
  mean_bandung, sd_bandung, n_bandung,
  mean_bali, sd_bali, n_bali,
  alternative = "two.sided", var.equal = TRUE
)

t_value <- unname(res$statistic)
p_value <- res$p.value
cat("T-value = ", t_value, "\n")
cat("P-value = ", p_value, "\n")
  
# c. Lakukan uji statistik (df = 2)
df <- 2
#plotDist(dist = 't', df = df)
  
# d. Nilai kritikal
alpha <- 0.05
nilai_kritikal <- qt(1 - alpha/2, df)
cat("Nilai kritikal kiri: ", -nilai_kritikal, "\n")
cat("Nilai kritikal kanan: ", nilai_kritikal, "\n")
  
# e. Keputusan
if(p_value > alpha & p_value < (1-alpha)) {
  # Menerima status quo
  cat("Keputusan: H0 tidak ditolak\n")
} else {
  # Menolak status quo
  cat("Keputusan: H0 ditolak, H1 diterima\n")
}

# f. Kesimpulan
if(p_value > alpha & p_value < (1-alpha)) {
  # Menerima status quo
  cat("Kesimpulan:",
      "Rata-rata jumlah saham di Bandung dan Bali sama\n")
} else {
  # Menolak status quo
  cat("Kesimpulan:",
      "Rata-rata jumlah saham di Bandung dan Bali tidak sama\n")
}