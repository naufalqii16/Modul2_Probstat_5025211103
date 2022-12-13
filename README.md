# SOAL 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 :

|Responden   |  x  |  y  |
|----------- |----|----|
| 1          |  78  |  100  |
| 2         |  75  |  95  |
| 3          |  67  |  70  |
| 4         |  77  |  90  |
| 5          |  70  |  90  |
| 6         |  72  |  90  |
| 7          |  78  |  89  |
| 8         |  74  |  90  |
| 9          |  77  |  100  |

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

> a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

Dalam mencari standar deviasi dari data selish tersebut, digunakan beberapa cara. `Pertama`, masukkan data yang telah ada ke dalam variabel sesuai pengelompokannya.

```R
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```

`Kedua`, cari selisih antar data dengan `index yang sama`. Kemudian, dilakukan pencarian rata-rata dari selisih-selisih tersebut untuk digunakan dalam mencari nilai standar deviasinya.

```R
difference <- after - before
difference
mean(difference)
sd(difference)
```


> b. carilah nilai t (p-value)

Solusi dilakukan dengan menggunakan fungsi `t.test()` sebagai berikut dengan parameter masukan data yaitu data kelompok yang telah dikelompokkan pada poin sebelumnya.

```R
t.test(after, before, paired = TRUE)
```
> c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

Berdasarkan hasil dari poin sebelumnya, diketahui bahwa nilai probabilitas dari uji 𝑡 (p-value) adalah `6.003e-05` atau `0.00006003`. Karena nilai probabilitas tersebut lebih kecil dibandingkan tingkat signifikansi `𝛼 = 0.05`, maka hipotesis nol ditolak dan hipotesis alternatif diterima.

Dengan demikian, dapat disimpulkan bahwa terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 pada tingkat signifikansi 5%.



# SOAL 2

Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

> a. Apakah Anda setuju dengan klaim tersebut?

Setuju, karena dengan rata-rata 23.5000 dari sampel acak dengan standar deviasi 3900 kilometer, maka sangatlah mungkin klaim tersebut valid. Hal itu karena grafik dari persebaran data distribusi normal yang dihasilkan akan lebih pekat di daerah lebih dari 20.000 kilometer dengan asumsi nilai tengah grafik tersebut adalah rata-rata dari sampel acak yang didapatkan.

Selanjutnya, digunakan sebuah package library BSDA untuk membuat solusi permasalahannya.

```R
install.packages("BSDA")
library(BSDA)
```

> b. Jelaskan maksud dari output yang dihasilkan! 

Fungsi yang digunakan adalah fungsi tsum.test() dengan parameter-parameter yang disebutkan pada poin sebelumnya. Hasilnya adalah sebagai berikut.

```R
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
```

Hal tersebut berarti dengan interval kepercayaan 95%, rata-rata jarak tempuh mobil per tahun berada di antara 22.726,16 km dan 24.273,84 km.

Dengan interval kepercayaan 95% dan dari 100 responden, dapat dibuktikan bahwa rata-rata jarak tempuh mobil per thn lebih dari 20.000 km karena nilai p-value kurang dari tingkat signifikansi 𝛼 = 0.05.

> c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Karena nilai probabilitas tersebut lebih kecil dibandingkan tingkat signifikansi 𝛼 = 0.05, maka hipotesis nol ditolak dan hipotesis alternatif diterima. Sehingga, kesimpulan yang didapatkan yaitu bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.


# SOAL 3

(Hipotesa 2 sampel) Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.


|Nama Kota/Atribut   |  Bandung  |  Bali  |
|----------- |----|----|
| Jumlah Saham          |  19  |  27  |
| Sampel Mean         |  3.64  |  2.79  |
| Sampel Standar Deviasi          |  1.67  |  1.32  |


Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

> a. H0 dan H1(3) 

Berdasarkan deskripsi dan data yang terlampir, maka dapat disusun hipotesis H0 dan H1 sebagai berikut.

* H0 ← μ1 = μ2 (rata-rata saham di Bandung sama dengan di Bali)
* H1 ← μ1 ≠ μ2 (rata-rata saham di Bandung tidak sama dengan di Bali)



> b. Hitung Sampel Statistik(3)

Solusi dilakukan dengan menggunakan fungsi tsum.test() dengan parameter sesuai dengan data pada tabel terlampir. Fungsi tersebut menghasilkan nilai dari sampel statistik.

```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
```

> c. Lakukan Uji Statistik (df =2)(5)

Digunakan sebuah package library Mosaic untuk membuat solusi permasalahannya.

```R
install.packages("mosaic")
library(mosaic)
```
Selanjutnya, digunakan fungsi plotDist() untuk mendapatkan gambaran atau visualisasi dari statistik dengan derajat bebas sebesar 2.

```R
plotDist(dist = 't', df = 2, col = "blue")
```

> d. Nilai Kritikal(3

Digunakan fungsi qchisq() dengan nilai df sesuai dengan yang telah terlampir untuk mendapatkan nilai kritikal.

```R
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```



> e. Keputusan(3)

Teori keputusan adalah teori formal pengambilan keputusan di bawah ketidakpastian. Aksinya adalah ({a}\_{a∈A}) dengan kemungkinan konsekuensinya adalah ({c}_{c∈C}) (tergantung pada keadaan dan tindakan).

Maka keputusan dapat diperoleh dengan fungsi t.test

> f. Kesimpulan(3)

Kesimpulan yang didapatkan yaitu perbedaan rata-rata yang terjadi tidak ada jika dilihat dari uji statistik.

Namun, akan ada (meski tidak signifikan) jika dipengaruhi oleh nilai kritikal.


# SOAL 4

Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. 
Jika : 

diketahui dataset  https://intip.in/datasetprobstat1 
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

Maka Kerjakan atau Carilah:

> a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

`Pertama`, memasukkan data dari dataset yang disediakan.

```R
dataoneway <- read.table("data_soal_4.txt", h = T)
attach(dataoneway)
names(dataoneway)
```

Kedua, melakukan grouping sesuai dengan label yang telah ditentukan sekaligus melakukan pengecekan value dalam grup yang dihasilkan.

```R
dataoneway$Group <- as.factor(dataoneway$Group)
dataoneway$Group = factor(dataoneway$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataoneway$Group)
```

Ketiga, membagi tiap valuer menjadi 3 bagian sesuai dengan label grup yang telah dibuat.

```R
Group1 <- subset(dataoneway, Group == "Kucing Oren")
Group2 <- subset(dataoneway, Group == "Kucing Hitam")
Group3 <- subset(dataoneway, Group == "Kucing Putih")
```

Keempat, menggambar plot kuantil normal untuk setiap grup untuk melihat distribusi data dan outlier utama dalam homogenitas varians pada masing-masing grup.

```R
qqnorm(Group1$Length)
qqline(Group1$Length)
```


```R
qqnorm(Group2$Length)
qqline(Group2$Length)
```


```R
qqnorm(Group3$Length)
qqline(Group3$Length)
```

> b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?


Untuk mendapatkan homogeneity of variances, digunakan sebuah fungsi yaitu fungsi bartlett.test() dengan parameter dari data yang telah dimasukkan sebelumnya.

```R
bartlett.test(Length ~ Group, data = dataoneway)
```

Dari hasil uji fungsi bartlett.test() didapatkan p-value sebesar 0.8054 yang lebih dari nilai 𝛼 = 0.05 sehingga asumsi kesamaan varians terpenuhi.

> c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.


Untuk membuat uji anova dan model liniernya, digunakan fungsi yaitu fungsi lm() dan anova() dengan parameter dari data yang telah dimasukkan sebelumnya.

```R
model1 = lm(Length ~ Group, data = dataoneway)
anova(model1)
```

> d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?


Berdasarkan hasil yang didapatkan pada poin sebelumnya, pada taraf uji 5% didapatkan nilai p-value sebesar 0.0013. Maka, terdapat perbedaan panjang kucing yang signifikan berdasarkan grupnya.


> e. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

Untuk verifikasi jawaban model 1 sebelumnya, digunakan sebuah fungsi yaitu fungsi TukeyHSD() dengan parameter model 1 dari AOV sebelumnya.

```R
TukeyHSD(aov(model1))
```

Dari hasil uji Tukey, dapat dilihat kombinasi dari kelompok mana yang secara signifikan berbeda. Jika menggunakan 𝛼 = 5%, perbedaan panjang kucing yang signifikan adalah grup 2 (Kucing Hitam) terhadap grup 1 (Kucing Oren) dan grup 3 (Kucing Putih).

> f. Visualisasikan data dengan ggplot2

Digunakan fungsi ggplot() untuk melakukan visualisasi data.

```R
install.packages("ggplot2")
library("ggplot2")

ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")
```


# SOAL 5

(Anova dua arah) 
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: [Data Hasil Eksperimen](https://drive.google.com/file/d/1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ/view?usp=sharing). Dengan data tersebut: 

> a. Buatlah plot sederhana untuk visualisasi data!

Buatlah plot sederhana untuk visualisasi data


```R
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
```

Kedua, memasukkan dan membaca dataset yang telah disediakan.

```R
GTL <- read_csv("data_soal_5.csv")
head(GTL)
```
Ketiga, melakukan observasi pada dataset.


```R
str(GTL)
```

Keempat, melakukan viasualisasi dengan menggunakan simple plot dengan fungsi qplot() sebagai berikut.

```R
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```

> b. Lakukan uji ANOVA dua arah

Pertama, membuat variabel as factor sebagai ANOVA.

```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```

Kedua, melakukan analisis of variance (AoV) dengan fungsi summary(aov()) sebagai berikut.

```R
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

> c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

Sebagai solusinya, digunakan fungsi `group_by()` yang selanjutnya digunakan untuk melakukan data summary dengan fungsi `summarise()` sesuai mean dan standar deviasi yang berlaku sebagai berikut.

```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```

> d. Lakukan uji Tukey

Pengujian Tukey menggunakan fungsi TukeyHSD() sebagai berikut.

```R
tukey <- TukeyHSD(anova)
print(tukey)
```

> e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

```R
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```

Kedua, menambahkan compact letter display tersebut ke tabel dengan mean dan standar deviasi yang telah dibuat sebelumnya.

```R
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```

