# Nama  : Ghifari Maaliki Syafa Syuhada
# NRP   : 5025211158
# Kelas : Probabilitas dan Statistika C
#
# ---------- Modul 2 Praktikum Probabilitas dan Statistik 2023 ----------
# ------------ Estimasi Parameter, Uji Hipotesis, dan ANOVA -------------

# install.packages("BSDA")
library(BSDA)

# 1
 
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)
selisih <- Y-X

# a. Standar deviasi selisih
standar_deviasi <- sd(selisih)
cat("Standar Deviasi selisih X dan Y : ", standar_deviasi, "\n")

# b. Carilah nilai t (p-value)
res <- t.test(selisih)
t_value <- unname(res$statistic)
p_value <- res$p.value
cat("T-value = ", t_value, "\n")
cat("P-value = ", p_value, "\n")

# c. Pengaruh terhadap saturasi oksigen
alpha <- 0.05
if(p_value > alpha/2 & p_value < (1-alpha/2)) {
  # Menerima status quo
  cat("Kesimpulan:",
  "Tidak ada pengaruh yang signifikan secara statistika 
  dalam hal kadar saturasi oksigen sebelum dan sesudah
  melakukan aktivitas.\n")
} else {
  # Menolak status quo
  cat("Kesimpulan:",
  "Ada pengaruh yang signifikan secara statistika 
  dalam hal kadar saturasi oksigen sebelum dan sesudah
  melakukan aktivitas.\n")
}