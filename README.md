# Estonia-Energy-Consumption-BI-Dashboard
SQL Server ve Power BI kullanılarak tasarlanan uçtan uca İş Zekası (BI) projesi. Enerji şebekesine ait tüketim, üretim ve finansal ciro analizi.
# ⚡ Estonya Enerji Şebekesi - Veri Mimarisi ve İş Zekası (BI) Analizi

Bu proje, bir enerji dağıtım şirketinin saatlik şebeke tüketim ve güneş enerjisi üretim verilerini uçtan uca (End-to-End) modelleyen kapsamlı bir veri analitiği çalışmasıdır. 

Milyonlarca satırlık ham veri; Microsoft SQL Server üzerinde işlenip temizlenmiş, ardından Power BI üzerinde üst yönetimin stratejik kararlar almasını sağlayacak dinamik bir finansal ve operasyonel panoya (Executive Dashboard) dönüştürülmüştür.

## 🎯 Projenin İş Hedefi (Business Objective)
* Şebeke üzerindeki ticari ve bireysel enerji tüketimlerinin finansal büyüklüğünü (Euro bazında ciro) hesaplamak.
* Güneş enerjisi (üretim) ile şebeke yükü (tüketim) arasındaki 24 saatlik arz-talep döngüsünü tespit etmek.
* İlçelere göre altyapı kapasitesini (kurulu güç) ve aktif abone yoğunluğunu ölçerek gelecekteki şebeke yatırımlarına yön vermek.

*(Not: Projede kullanılan ham veri seti Kaggle'dan alınmış olup, toplam boyutu (1+ GB) nedeniyle bu repoya dahil edilmemiştir. Sadece SQL mimarisi ve Power BI şablonu sunulmuştur.)*

## 🛠️ Kullanılan Teknolojiler ve Araçlar
* **Veritabanı Yönetimi:** Microsoft SQL Server (T-SQL)
* **İş Zekası & Görselleştirme:** Power BI
* **Veri Modelleme (Data Modeling):** Star Schema, DAX (Data Analysis Expressions), Power Query
* **Kavramlar:** Bileşik Anahtar (Composite Key) Yönetimi, Zaman Zekası (Time Intelligence), ETL Süreçleri.

## 🚧 Çözülen Veri Mühendisliği Problemleri
Bu proje basit bir sürükle-bırak işlemi değil, gerçek sektör sorunlarının teknik olarak çözüldüğü bir mimari üzerine inşa edilmiştir:

1. **Zaman Granülaritesi (Granularity) Uyumu:** Saatlik tüketim verileri (`datetime`) ile günlük borsa fiyatları (`date`) arasındaki yapısal uyumsuzluk, SQL'de `CAST()` fonksiyonu kullanılarak aşılmış ve farklı zaman detayındaki tablolar `LEFT JOIN` ile kayıpsız birleştirilmiştir.
2. **Kartezyen Çarpım (Cartesian Explosion) Yönetimi:** Abonelerin güneş paneli kapasitelerinin aydan aya değişmesi nedeniyle SQL'de oluşan milyarlarca satırlık veri patlaması analiz edilmiş; kurguya "Tarih Kilidi" eklenerek tablo 2 Milyon satırlık optimize bir View'a dönüştürülmüştür.
3. **Bölgesel Format (Locale) Kaynaklı Finansal Hatalar:** Sistem bölgesel ayarlarından (Nokta/Virgül uyuşmazlığı) kaynaklanan ve bütçeyi binlerce kat şişiren veri tipi bozulmaları, Power Query katmanında standart matematiksel dönüşümlerle (Bölme Operasyonu) temizlenerek gerçek milyarlık ciro rakamlarına ulaşılmıştır.
4. **Zaman Zekası ve Takvim Entegrasyonu:**
   Yıllık değişimleri (YoY%) hatasız ölçebilmek adına Power BI'da DAX ile özel bir `Takvim` (Date) tablosu yaratılmış; ana tablodaki saatli veriler `DATEVALUE` ile köprülenerek "(Blank)" ilişki hataları tamamen ortadan kaldırılmıştır.

## 📊 Temel Çıktılar ve Operasyonel İçgörüler
* **24 Saatlik Üretim/Tüketim Trendi:** Güneş enerjisi üretiminin fiziksel olarak tam 13:00'te zirve (peak) yaptığı, şebeke yükünün ise mesai bitimi olan 18:00 - 20:00 aralığında maksimuma ulaştığı tespit edilmiştir.
* **Müşteri Segmentasyonu:** Toplam tüketim maliyetinin ~%86'sının ticari (sanayi) işletmelerden, geriye kalan kısmın ise evsel (bireysel) kullanımdan geldiği görülmüştür.

---

## 📸 Dashboard Görünümleri

### 1. Finansal Özet ve Ciro Analizi
Yönetim kuruluna hitap eden, toplam maliyetlerin ve sözleşme bazlı gelir dağılımlarının yer aldığı ana sayfa.

<img width="1958" height="1103" alt="Finansal_Ozet" src="https://github.com/user-attachments/assets/43ecd5d7-4aeb-4509-a7ab-cef424189faa" />


### 2. Saatlik Trend ve Zaman Zekası
Günün saatlerine göre üretim/tüketim dengesini ve "Yıl/Ay/İlçe" bazlı dinamik başlıklarla desteklenmiş zaman serisi analizi.

 <img width="1948" height="1096" alt="Trend_Bolge_Analiz" src="https://github.com/user-attachments/assets/2e4d30e5-6b51-4b76-ab27-7a1878ebd449" />


### 3. Müşteri ve Kapasite Altyapısı
Hizmet verilen 16 farklı ilçenin abone yoğunluğunu ve tüketim profillerini gösteren yatırım planlama matrisi.
 
<img width="1939" height="1093" alt="Musteri_Kapasite" src="https://github.com/user-attachments/assets/ab53d463-e8cc-4b2b-8731-b24d2c6b4c63" />
