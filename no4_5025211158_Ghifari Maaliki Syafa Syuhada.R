# Nama  : Ghifari Maaliki Syafa Syuhada
# NRP   : 5025211158
# Kelas : Probabilitas dan Statistika C
#
# ---------- Modul 2 Praktikum Probabilitas dan Statistik 2023 ----------
# ------------ Estimasi Parameter, Uji Hipotesis, dan ANOVA -------------

# install.packages("BSDA")
library(BSDA)

# install.packages("ggplot2")
library("ggplot2")

# install.packages("dplyr")
library(dplyr)

# 4
data <- read.csv("C:\\Work\\Kuliah\\smt4\\Probabilitas dan Statistika\\Prak2_Probstat2023_C_5025211158\\GTL.csv")

# a. Plot sederhana untuk visualisasi data.
ggplot(data, aes(x = Temp, y = Light, color = Glass)) +
  geom_point() +
  labs(x = "Temp", y = "Light", color = "Glass") +
  ggtitle("Pengaruh Suhu Operasi dan Jenis Kaca terhadap Keluaran Cahaya")

# b. Uji ANOVA dua arah
res <- aov(Light ~ Temp * Glass, data = data)
summary(res)

# c. Tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan
summary_table <- summarize(group_by(data, Temp, Glass), Mean = mean(Light), SD = sd(Light))
print(summary_table)