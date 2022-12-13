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
![1a](https://user-images.githubusercontent.com/115441787/207205302-fe5dea20-8f7c-4abb-8ee0-dd19f2bec5e3.png)


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

![](https://user-images.githubusercontent.com/115441787/207205523-f53b8c5e-b3c4-4cc8-94c1-8dac2acdbdb9.png)

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
![](https://user-images.githubusercontent.com/115441787/207205937-cfb565af-1690-4ada-9dd1-a6ec1fa5c6d7.png)

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
![](https://user-images.githubusercontent.com/115441787/207206174-91b4e824-f1e0-4c77-becf-efbd2341bf93.png)


> c. Lakukan Uji Statistik (df =2)

dengan perhitungan tersebut didapatkan t = 1.9267, dan p-value = 0.03024. 

> d. Nilai Kritikal(3

Digunakan fungsi qchisq() dengan nilai df sesuai dengan yang telah terlampir untuk mendapatkan nilai kritikal.

```R
qt(0.025,df = 2,lower.tail=FALSE)
qt(0.025,df = 2,lower.tail=TRUE)
```

![](https://user-images.githubusercontent.com/115441787/207313965-21524c0c-1563-4793-8e9c-bc285c0cbf5a.png)



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
mydata <- read.table("Data_soal_4.txt", h = T)
attach(mydata)
names(mydata)
```

![](https://user-images.githubusercontent.com/115441787/207295159-d490dafe-c1ba-42c6-a14b-ae44bf7cb1af.png)



Kedua, melakukan grouping sesuai dengan label yang telah ditentukan sekaligus melakukan pengecekan value dalam grup yang dihasilkan.

```R
mydata$Group <- as.factor(mydata$Group)
mydata$Group = factor(mydata$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(mydata$Group)
```

![](https://user-images.githubusercontent.com/115441787/207314826-ec779906-4b7f-4486-9a90-c5fe4189a3ef.png)

Ketiga, membagi tiap valuer menjadi 3 bagian sesuai dengan label grup yang telah dibuat.

```R
Group1 <- subset(mydata, Group == "Kucing Oren")
Group2 <- subset(mydata, Group == "Kucing Hitam")
Group3 <- subset(mydata, Group == "Kucing Putih")
```
![](https://user-images.githubusercontent.com/115441787/207315036-ea6609d9-ba7c-4088-9b29-ff2fe1336f7d.png)


Keempat, menggambar plot kuantil normal untuk setiap grup untuk melihat distribusi data dan outlier utama dalam homogenitas varians pada masing-masing grup.

```R
qqnorm(Group1$Length)
qqline(Group1$Length)
```
![](https://user-images.githubusercontent.com/115441787/207295095-bae65c9b-a25d-40b9-ac2e-1d7758df4fa2.png)


```R
qqnorm(Group2$Length)
qqline(Group2$Length)
```
![](https://user-images.githubusercontent.com/115441787/207295466-d4e6a3ee-1b42-4c14-91f0-4cfde35208bf.png)



```R
qqnorm(Group3$Length)
qqline(Group3$Length)
```
![](https://user-images.githubusercontent.com/115441787/207295640-a7f1aa5e-06de-413d-804c-1f19f97ddf4f.png)


> b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?


Untuk mendapatkan homogeneity of variances, digunakan sebuah fungsi yaitu fungsi bartlett.test() dengan parameter dari data yang telah dimasukkan sebelumnya.

```R
bartlett.test(Length ~ Group, data = mydata)
```
![](https://user-images.githubusercontent.com/115441787/207295986-f82b7a13-a8c3-4250-80aa-6b5482aa6e25.png)

Dari hasil uji fungsi bartlett.test() didapatkan p-value sebesar 0.8054 yang lebih dari nilai 𝛼 = 0.05 sehingga asumsi kesamaan varians terpenuhi.

> c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.


Untuk membuat uji anova dan model liniernya, digunakan fungsi yaitu fungsi lm() dan anova() dengan parameter dari data yang telah dimasukkan sebelumnya.

```R
model1 = lm(Length ~ Group, data = mydata)
anova(model1)
```
![](https://user-images.githubusercontent.com/115441787/207296193-70b75e13-cab0-4b3b-9d47-94ee53e88d60.png)


> d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?


Berdasarkan hasil yang didapatkan pada poin sebelumnya, pada taraf uji 5% didapatkan nilai p-value sebesar 0.0013. Maka, terdapat perbedaan panjang kucing yang signifikan berdasarkan grupnya.


> e. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

Untuk verifikasi jawaban model 1 sebelumnya, digunakan sebuah fungsi yaitu fungsi TukeyHSD() dengan parameter model 1 dari AOV sebelumnya.

```R
TukeyHSD(aov(model1))
```

![](https://user-images.githubusercontent.com/115441787/207296460-246ce540-22f4-4163-a049-9888ce190d3e.png)

Dari hasil uji Tukey, dapat dilihat kombinasi dari kelompok mana yang secara signifikan berbeda. Jika menggunakan 𝛼 = 5%, perbedaan panjang kucing yang signifikan adalah grup 2 (Kucing Hitam) terhadap grup 1 (Kucing Oren) dan grup 3 (Kucing Putih).

> f. Visualisasikan data dengan ggplot2

Digunakan fungsi ggplot() untuk melakukan visualisasi data.

```R
install.packages("ggplot2")
library("ggplot2")

ggplot(mydata, aes(x = Group, y = Length)) + geom_boxplot(fill = "yellow", colour = "black") + scale_x_discrete() + xlab("Jenis Kucing") + ylab("Panjang Kucing (cm)")
```

![](https://user-images.githubusercontent.com/115441787/207315772-f77a3ab3-51f5-41a6-974d-0551afc8a481.jpg)


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
GTL <- read_csv("Data_soal_5.csv")
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
![](https://user-images.githubusercontent.com/115441787/207317681-310d1f56-d0cf-4256-8883-513e42e5c565.png)

> b. Lakukan uji ANOVA dua arah

Pertama, membuat variabel as factor sebagai ANOVA.

```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```
![](https://user-images.githubusercontent.com/115441787/207317854-371b4dac-18fe-4af2-b799-eec4a3d2540f.png)

Kedua, melakukan analisis of variance (AoV) dengan fungsi summary(aov()) sebagai berikut.

```R
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

![](https://user-images.githubusercontent.com/115441787/207317961-b7bda75a-163b-4965-8f7d-fb0b2f9ed0d6.png)



> c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

Sebagai solusinya, digunakan fungsi `group_by()` yang selanjutnya digunakan untuk melakukan data summary dengan fungsi `summarise()` sesuai mean dan standar deviasi yang berlaku sebagai berikut.

```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
![](https://user-images.githubusercontent.com/115441787/207318059-a692333a-c31f-4cbb-9e67-e068c80bf805.png)


> d. Lakukan uji Tukey

Pengujian Tukey menggunakan fungsi TukeyHSD() sebagai berikut.

```R
tukey <- TukeyHSD(anova)
print(tukey)
```
![](https://user-images.githubusercontent.com/115441787/207318143-facbf941-cd9d-4789-80eb-c57a087b22cb.png)

![](https://user-images.githubusercontent.com/115441787/207318255-b8947789-1758-4bfa-b7ce-c9f05696c655.png)


> e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

```R
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```

![](https://user-images.githubusercontent.com/115441787/207318435-f2b88157-6442-49b2-8de8-ce35c6ea5602.png)


Kedua, menambahkan compact letter display tersebut ke tabel dengan mean dan standar deviasi yang telah dibuat sebelumnya.

```R
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```

![](https://user-images.githubusercontent.com/115441787/207318498-a13ab403-040b-45fd-908f-37a225e6181d.png)
