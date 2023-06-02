# Nama  : Ghifari Maaliki Syafa Syuhada
# NRP   : 5025211158
# Kelas : Probabilitas dan Statistika C
#
# ---------- Modul 2 Praktikum Probabilitas dan Statistik 2023 ----------
# ------------ Estimasi Parameter, Uji Hipotesis, dan ANOVA -------------

# install.packages("BSDA")
library(BSDA)

# 2
mean_p <- 25000
mean_s <- 23500
n <- 100
standar_deviasi <- 3000

# a.
res = zsum.test(mean_s, standar_deviasi, n, alternative = "greater", mu = mean_p)

alpha <- 0.05
p_value <- res$p.value
cat("P-Value = ", p_value, "\n")

# c.
if(p_value > alpha) {
  # Menerima status quo
  cat("Kesimpulan:",
  "Mobil dikemudikan rata-rata lebih dari 25.000 kilometer per tahun.\n")
} else {
  # Menolak status quo
  cat("Kesimpulan:",
  "Mobil dikemudikan rata-rata kurang dari 25.000 kilometer per tahun.\n")
}