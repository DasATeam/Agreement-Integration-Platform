# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#required documents
ktp = DocumentType.create(name: "Kartu Tanda Penduduk (KTP) atau KITAS Direksi")
npwp = DocumentType.create(name: "Nomor Pokok Wajib Pajak (NPWP)")
kerjasama = DocumentType.create(name: "Fotokopi Perjanjian Kerjasama ini")
akta = DocumentType.create(name: "Akta Pendirian Usaha serta perubahannya")
sk = DocumentType.create(name: "Surat Keputusan Menteri Hukum dan HAM")

kantor = DocumentType.create(name: "Surat sewa atau bukti kepemilikan kantor")
siup = DocumentType.create(name: "Surat Ijin Usaha Perdangangan (SIUP) atau sejenisnya")
tdp = DocumentType.create(name: "Tanda Daftar Perusahaan (TDP)")
bkpma = DocumentType.create(name: "Surat Badan Koordinasi Penanaman Modal (BKPMA) jika ada mendapatkan injeksi dana dari pihak asing")
rekening = DocumentType.create(name: "Rekening koran usaha minimal 3 bulan terakhir")
foto = DocumentType.create(name: "Foto lokasi usaha")

form_bca = DocumentType.create(name: "Form BCA", is_additional: true)
form_bni = DocumentType.create(name: "Form BNI", is_additional: true)
form_bri = DocumentType.create(name: "Form BRI", is_additional: true)
form_mandiri = DocumentType.create(name: "Form Mandiri", is_additional: true)
form_bca2 = DocumentType.create(name: "Form BCA lampiran", is_additional: true)

#channels
bni1 = ChannelType.create(partner: "Bank Negara Indonesia (BNI)", name: "Transaksi Kartu - Aggregator", charge: "3.2% + Rp. 2,750")
bni2 = ChannelType.create(partner: "Bank Negara Indonesia (BNI)", name: "Transaksi Kartu - Fasilitator", charge: "Biaya transaksi dari Bank + Rp. 2,750")

cimb1 = ChannelType.create(partner: "Bank CIMB Niaga", name: "Transaksi Kartu - Aggregator", charge: "3.2% + Rp. 2,750")
cimb2 = ChannelType.create(partner: "Bank CIMB Niaga", name: "Transaksi Kartu - Fasilitator", charge: "Biaya transaksi dari Bank + Rp. 2,750")
cimb3 = ChannelType.create(partner: "Bank CIMB Niaga", name: "Internet Banking - CIMB Clicks", charge: "Rp. 5,000")

mandiri1 = ChannelType.create(partner: "Bank Mandiri", name: "Transaksi Kartu - Fasilitator", charge: "Biaya transaksi dari Bank + Rp. 2,750")
mandiri2 = ChannelType.create(partner: "Bank Mandiri", name: "Internet Banking - Mandiri Clickpay", charge: "Rp. 5,000")
mandiri3 = ChannelType.create(partner: "Bank Mandiri", name: "Bill Payment", charge: "Rp. 5,390")
mandiri4 = ChannelType.create(partner: "Bank Mandiri", name: "E-Money - e-cash", charge: "1% untuk transaksi min Rp. 250,000 atau Rp. 2,500 untuk transaksi di bawah Rp. 250,000")

bri = ChannelType.create(partner: "Bank Rakyat Indonesia (BRI)", name: "Internet Banking - e-Pay BRI", charge: "Rp. 5,000")

bca1 = ChannelType.create(partner: "Bank Central Asia (BCA)", name: "Transaksi Kartu - Fasilitator", charge: "Biaya transaksi dari Bank + Rp. 2,750")
bca2 = ChannelType.create(partner: "Bank Central Asia (BCA)", name: "Internet Banking - BCA KlikPay", charge: "Biaya transaksi dari Bank + Rp. 2,200")
bca3 = ChannelType.create(partner: "Bank Central Asia (BCA)", name: "Virtual Account", charge: "Biaya transaksi dari Bank + Rp. 2,750")

permata =   ChannelType.create(partner: "Bank Permata", name: "Virtual Account", charge: "Rp. 5,390")

telkom    = ChannelType.create(partner: "Telkomsel", name: "E-Money - Telkomsel TCash", charge: "Rp. 3,300")
xl        = ChannelType.create(partner: "XL  ", name: "E-Money - XL Tunai", charge: "Rp. 3,300")
isat      = ChannelType.create(partner: "Indosat Dompetku", name: "E-Money - Indosat Dompetku", charge: "Rp. 3,300")
indomaret = ChannelType.create(partner: "Indomaret", name: "Convenience Store - Indomaret", charge: "Biaya transaksi dari Indomaret")
bbm       = ChannelType.create(partner: "BBM Money", name: "E-Money - BBM Money", charge: "3% + Rp. 1,650")

#channels and required documents
transaksi_kartu = [ktp, npwp, kerjasama, akta, sk]
bni1.documents = transaksi_kartu
bni2.documents = transaksi_kartu
cimb1.documents = transaksi_kartu
cimb2.documents = transaksi_kartu
mandiri1.documents = transaksi_kartu
bca1.documents = transaksi_kartu

virtual_acc = [ktp, npwp, kerjasama]
mandiri3.documents = virtual_acc
bca3.documents = virtual_acc
permata.documents = virtual_acc

cimb3.documents = virtual_acc
mandiri2.documents = virtual_acc
mandiri4.documents = virtual_acc
bri.documents = virtual_acc
bca2.documents = virtual_acc
telkom.documents = virtual_acc
xl.documents = virtual_acc
isat.documents = virtual_acc
indomaret.documents = virtual_acc
bbm.documents = virtual_acc

bni1.documents << form_bni
bca1.documents << form_bca
bca2.documents << form_bca
bca3.documents << form_bca

link_bca = DocumentLink.create(link: "https://drive.google.com/open?id=0Bw3siKQNp04EcWtxNjFOSkNyVWc")
link_bni = DocumentLink.create(link: "https://drive.google.com/open?id=0Bw3siKQNp04ESlc1LWt6bWZ0b00")
link_bri = DocumentLink.create(link: "https://drive.google.com/open?id=0Bw3siKQNp04ENHR4Skl3TmhsM0k")
link_mandiri = DocumentLink.create(link: "https://drive.google.com/open?id=0Bw3siKQNp04ER0hvb0Q4Z2dvX00")
link_bca2 = DocumentLink.create(link: "https://drive.google.com/open?id=0Bw3siKQNp04EQm9CNGFKY1VKbnM")
link_bca.document_type = form_bca
link_bni.document_type = form_bni
link_bri.document_type = form_bri
link_mandiri.document_type = form_mandiri
link_bca2.document_type = form_bca2
link_bca.save()
link_bni.save()
link_bri.save()
link_mandiri.save()
link_bca2.save()

root = Point.create(id: 0, nomor: "0", isi: "")
p1 = Point.create(nomor: "1", isi: "Definisi")
p2 = Point.create(nomor: "2", isi: "Proses Pendaftaran dan Persyaratan Merchant")
p3 = Point.create(nomor: "3", isi: "Hak Dan Kewajiban Payment Gateway")
p4 = Point.create(nomor: "4", isi: "Hak dan Kewajiban Merchant")
p5 = Point.create(nomor: "5", isi: "Biaya Transaksi Dan Pembayaran Tagihan")
p6 = Point.create(nomor: "6", isi: "Penghentian Sementara Layanan Sistem Pembayaran Internet")
p7 = Point.create(nomor: "7", isi: "Keamanan dan Perlindungan Informasi")
p8 = Point.create(nomor: "8", isi: "Jangka Waktu Dan Pengakhiran Perjanjian")
p9 = Point.create(nomor: "9", isi: "Pernyataan Dan Jaminan")
p10 = Point.create(nomor: "10", isi: "Domisili Hukum dan Penyelesaian Sengketa")
p11 = Point.create(nomor: "11", isi: "Ingkar Janji (Wanprestasi)")
p12 = Point.create(nomor: "12", isi: "Kerahasiaan")
p13 = Point.create(nomor: "13", isi: "Keadaan Memaksa (Force Majeure)")
p14 = Point.create(nomor: "14", isi: "Ketentuan Lainnya")

root.points << p1
root.points << p2
root.points << p3
root.points << p4
root.points << p5
root.points << p6
root.points << p7
root.points << p8
root.points << p9
root.points << p10
root.points << p11
root.points << p12
root.points << p13
root.points << p14

p1_1 = Point.create(nomor: "1.1", isi: "Bank adalah badan hukum yang bergerak di bidang perbankan dan didirikan berdasarkan hukum Indonesia, yang dalam hal ini memiliki fungsi sebagai penyedia jasa sarana Layanan Pembayaran. Daftar nama Bank serta jenis ")
p1_2 = Point.create(nomor: "1.2", isi: "Biaya Transaksi adalah biaya yang dikenakan oleh Payment Gateway kepada Merchant untuk setiap Transaksi Internet berhasil, yang perhitungannya diatur lebih lanjut di dalam Lampiran 2 Perjanjian ini.")
p1_3 = Point.create(nomor: "1.3", isi: "Hari Kerja adalah hari selain Sabtu, Minggu dan hari libur nasional, di mana bank-bank di Indonesia buka dan operasional untuk kegiatan sehari-hari.")
p1_4 = Point.create(nomor: "1.4", isi: "Layanan Pembayaran adalah jenis-jenis metode pembayaran Transaksi Internet yang tersedia di Sistem Pembayaran Internet. Metode pembayaran yang dimaksud akan dijelaskan lebih lanjut di dalam Lampiran 1 Perjanjian ini." )
p1_5 = Point.create(nomor: "1.5", isi: "Pelanggan adalah pelaku Transaksi Internet di Merchant, melalui Sistem Pembayaran Internet." )
p1_6 = Point.create(nomor: "1.6", isi: "Refund adalah pengembalian dana Transaksi Internet kepada Pelanggan karena pembatalan atas Transaksi Internet tersebut.")
p1_7 = Point.create(nomor: "1.7", isi: "Sistem Pembayaran Internet adalah sistem pembayaran yang dimiliki dan dikelola oleh Payment Gateway, yang menghubungkan antara Bank/Service Provider, Payment Gateway, dan Merchant.")
p1_8 = Point.create(nomor: "1.8", isi: "Service Provider adalah penyedia jasa metode pembayaran selain Bank, yang memiliki kerjasama dan telah terhubung dengan Payment Gateway. Daftar nama Service Provider serta Layanan Pembayaran yang digunakan akan dicantum di dalam Lampiran 1 Perjanjian ini.")
p1_9 = Point.create(nomor: "1.9", isi: "Transaksi Internet adalah transaksi melalui media elektronik yang dilakukan oleh Pelanggan di situs Merchant, dan diproses oleh Sistem Pembayaran Internet.")

p1.points << p1_1
p1.points << p1_2
p1.points << p1_3
p1.points << p1_4
p1.points << p1_5
p1.points << p1_6
p1.points << p1_7
p1.points << p1_8
p1.points << p1_9

p21 = Point.create(nomor: "2.1", isi: "Merchant setuju untuk memberikan salinan dari dokumen-dokumen resmi yang daftarnya dicantum di Lampiran 4 Perjanjian ini, sebagai persyaratan administratif Perjanjian ini.")
p22 = Point.create(nomor: "2.2", isi: "Transaksi Internet hanya dapat dilakukan melalui situs Merchant, dengan alamat URL dan/atau mobile apps")
p23 = Point.create(nomor: "2.3", isi: "Merchant berjanji untuk tidak menjual barang atau jasa yang melanggar hukum/peraturan perundang-undangan/ketertiban umum dan/atau yang secara spesifik dilarang oleh Bank, Service Provider atau Principal.")
p24 = Point.create(nomor: "2.4", isi: "Payment Gateway dapat menolak memberikan layanan kepada Merchant dengan kategori sebagai berikut:")
p241 = Point.create(nomor: "2.4.1", isi: "terlibat tindakan kriminal atau melanggar norma hukum, social, agama dan moral;")
p242 = Point.create(nomor: "2.4.2", isi: "terlibat dalam kelompok atau organisasi terlarang;")
p243 = Point.create(nomor: "2.4.3", isi: "masuk ke dalam daftar hitam Payment Gateway, Bank atau Service Provider.")
p25 = Point.create(nomor: "2.5", isi: "Merchant wajib memberikan pemberitahuan tertulis kepada Payment Gateway apabila Merchant merubah jenis usaha dan/atau jenis barang atau jasa yang ditawarkan melalui situs Merchant, serta dalam hal terjadi perubahan dalam susunan kepemilikan, Direksi atau penanggungjawab Merchant, sekurang-kurangnya 14 (empat belas) Hari Kerja sebelum perubahan tersebut dilakukan.")

p2.points << p21
p2.points << p22
p2.points << p23
p2.points << p24
p2.points << p25
p24.points << p241
p24.points << p242
p24.points << p243

p31 = Point.create(nomor: "3.1", isi: "Hak Payment Gateway, selain hak-hak yang telah dinyatakan dalam pasal-pasal lain Perjanjian ini adalah menerima pembayaran Biaya Transaksi untuk setiap Transaksi Internet yang berhasil, yang perhitungannya diatur di dalam Lampiran 2 Perjanjian ini.")
p32 = Point.create(nomor: "3.2", isi: "Kewajiban Payment Gateway, selain kewajiban-kewajiban yang telah dinyatakan dalam pasal-pasal lain Perjanjian ini adalah:")
p321 = Point.create(nomor: "3.2.1", isi: "mengelola dan merawat Sistem Pembayaran Internet agar tetap lancar dan operasional;")
p322 = Point.create(nomor: "3.2.2", isi: "menyediakan rekonsiliasi data Transaksi Internet untuk Merchant;")
p323 = Point.create(nomor: "3.2.3", isi: "memberikan informasi kepada Merchant akan status Transaksi Internet;")
p324 = Point.create(nomor: "3.2.4", isi: "memberikan dukungan teknis atau operasional kepada Merchant apabila diperlukan;")
p325 = Point.create(nomor: "3.2.5", isi: "menyiapkan Prosedur Operasi Standar (Standard Operating Procedure) untuk kebutuhan operasional layanan Sistem Pembayaran Internet antara Merchant dan Payment Gateway sebagaimana diatur dalam lampiran 6 Perjanjian; dan")
p326 = Point.create(nomor: "3.2.6", isi: "mematuhi ketentuan dan persyaratan dari masing-masing Layanan Pembayaran yang telah ditetapkan oleh Bank dan Service Provider.")

p3.points << p31
p3.points << p32
p32.points << p321
p32.points << p322
p32.points << p323
p32.points << p324
p32.points << p325
p32.points << p326

p41 = Point.create(nomor: "4.1", isi: "mendapatkan dukungan teknis maupun operasional dari Payment Gateway;")
p411 = Point.create(nomor: "4.1.1", isi: "mendapatkan dukungan teknis maupun operasional dari Payment Gateway;")
p412 = Point.create(nomor: "4.1.2", isi: "menerima informasi status Transaksi Internet; dan")
p413 = Point.create(nomor: "4.1.3", isi: "menerima edukasi terkait akan penyelenggaraan layanan Sistem Pembayaran Internet.")
p42 = Point.create(nomor: "4.2", isi: "Kewajiban Merchant, selain kewajiban-kewajiban yang telah dinyatakan dalam pasal-pasal lain Perjanjian ini adalah:")
p421 = Point.create(nomor: "4.2.1", isi: "melakukan pembayaran kepada Payment Gateway atas Biaya Transaksi sebagaimana diatur di dalam Lampiran 2 Perjanjian ini;")
p422 = Point.create(nomor: "4.2.2", isi: "menampilkan ketentuan bertransaksi sebagai panduan bagi Pelanggan;")
p423 = Point.create(nomor: "4.2.3", isi: "menyimpan bukti Transaksi Internet selama sekurang-kurangnya 24 (dua puluh empat) bulan setelah tanggal terjadinya Transaksi Internet;")
p424 = Point.create(nomor: "4.2.4", isi: "memiliki kebijakan pengembalian dana (chargeback) Transaksi Internet atau Refund; dan")
p425 = Point.create(nomor: "4.2.5", isi: "mematuhi ketentuan dan persyaratan dari masing-masing Layanan Pembayaran yang telah ditetapkan oleh Bank dan Service Provider.")

p4.points << p41
p4.points << p42
p41.points << p411
p41.points << p412
p41.points << p413
p42.points << p421
p42.points << p422
p42.points << p423
p42.points << p424
p42.points << p425

p51 = Point.create(nomor: "5.1", isi: "Merchant wajib membayar Biaya Transaksi kepada Payment Gateway untuk setiap Transaksi Internet yang berhasil dengan rincian biaya sebagaimana yang dicantumkan di Lampiran 2 Perjanjian ini.")
p52 = Point.create(nomor: "5.2", isi: "Tata cara pembayaran Biaya Transaksi dan/atau tagihan lainnya diatur dalam Lampiran 3 Perjanjian ini.")

p5.points << p51
p5.points << p52

p61 = Point.create(nomor: "6.1", isi: "Payment Gateway dapat setiap saat menghentikan/mematikan Sistem Pembayaran Internet untuk sementara waktu dengan pemberitahuan selambat-lambatnya 5 (lima) Hari Kerja sebelumnya kepada Merchant.")
p62 = Point.create(nomor: "6.2", isi: "Penghentian layanan Sistem Pembayaran Internet dapat disebabkan oleh alasan-alasan sebagai berikut: ")
p621 = Point.create(nomor: "6.3", isi: "inspeksi, perbaikan, pemeliharaan atau peningkatan sistem;")
p622 = Point.create(nomor: "6.2.2", isi: "adanya alasan tertentu berupa melindungi hak-hak dan/atau kepentingan Para Pihak; ")
p623 = Point.create(nomor: "6.2.3", isi: "alasan jelas lain yang ditentukan oleh Payment Gateway, Bank, atau Service Provider.")
p63 = Point.create(nomor: "6.3", isi: "Apabila terdapat gangguan tiba-tiba terhadap Sistem Pembayaran Internet akibat kegagalan sistem, jaringan, koneksi internet atau alasan lainnya, Payment Gateway akan memberitahu Merchant secara tertulis mengenai gangguan ini, serta informasi lanjutan apabila gangguan tersebut telah selesai.")

p6.points << p61
p6.points << p62
p6.points << p63
p62.points << p621
p62.points << p622
p62.points << p623

p71 = Point.create(nomor: "7.1", isi: "Payment Gateway memiliki sistem dan jaringan yang aman guna melindungi informasi yang bersifat sensitif, termasuk namun tidak terbatas kepada:")
p711 = Point.create(nomor: "7.1.1", isi: "informasi Transaksi Internet (nomor kartu, user id Pelanggan, dan lain-lain);")
p712 = Point.create(nomor: "7.1.2", isi: "informasi Pelanggan (data pribadi, alamat, dan lain-lain); dan")
p713 = Point.create(nomor: "7.1.3", isi: "informasi lainnya yang dianggap sensitif oleh Para Pihak.")
p72 = Point.create(nomor: "7.2", isi: "Payment Gateway akan menyimpan dan melindungi data Transaksi Internet selama 24 (dua puluh empat) bulan setelah tanggal terjadinya Transaksi Internet tersebut.")
p73 = Point.create(nomor: "7.3", isi: "Merchant menjamin bahwa Merchant tidak akan melakukan hal-hal sebagai berikut:")
p731 = Point.create(nomor: "7.3", isi: "melakukan upaya pemecahan kode (reverse engineering) terhadap Sistem Pembayaran Internet;")
p732 = Point.create(nomor: "7.3", isi: "melakukan hal-hal yang mengakibatkan kerusakan terhadap Sistem Pembayaran Internet dengan sengaja; atau")
p733 = Point.create(nomor: "7.3", isi: "melakukan hal-hal yang bertujuan untuk mencuri data Transaksi Internet dan Pelanggan")

p7.points << p71
p7.points << p72
p7.points << p73
p71.points << p711
p71.points << p712
p71.points << p713
p73.points << p731
p73.points << p732
p73.points << p733

p81 = Point.create(nomor: "8.1", isi: "Perjanjian ini berlaku selama 1 (satu) tahun sejak tanggal ditandatanganinya Perjanjian ini dan akan diperpanjang secara otomatis, sepanjang tidak ada pemberitahuan untuk mengakhiri Perjanjian sekurang-kurangnya 30 (tiga puluh) hari kalendar sebelum tanggal berakhirnya Perjanjian.")
p82 = Point.create(nomor: "8.2", isi: "Para Pihak berhak untuk sewaktu-waktu mengakhiri Perjanjian ini apabila terjadi salah satu dari hal-hal sebagai berikut:")
p821 = Point.create(nomor: "8.2.1", isi: "Salah satu Pihak melanggar salah satu ketentuan di Perjanjian ini, dan pelanggaran tersebut tidak dapat diperbaiki;")
p822 = Point.create(nomor: "8.2.2", isi: "Salah satu Pihak melanggar salah satu ketentuan di Perjanjian ini, dan pelanggaran tersebut dapat diperbaiki, namun Pihak yang melanggar tidak mampu memperbaiki pelanggaran tersebut dalam jangka waktu 30 (tiga puluh) hari kalendar sejak tanggal terjadinya pelanggaran tersebut; atau")
p823 = Point.create(nomor: "8.2.3", isi: "Salah satu Pihak pailit, menghentikan layanan serta kegiatan operasionalnya dan izin usahanya dicabut baik sebagian atau secara keseluruhan, memenuhi ketentuan Force Majeure Pasal 15 Perjanjian ini, dan oleh karena itu tidak mampu melanjutkan kegiatan usahanya;")
p83 = Point.create(nomor: "8.3", isi: "Pengakhiran Perjanjian ini tidak melepaskan Para Pihak dari kewajibannya yang timbul sebelum dan/atau pada saat pengakhiran Perjanjian ini. Para Pihak wajib menyelesaikan kewajiban dimaksud dalam jangka waktu selambat-lambatnya 7 (tujuh) Hari Kerja setelah tanggal efektif berakhirnya Perjanjian ini.")
p84 = Point.create(nomor: "8.4", isi: "Dalam pelaksanaan pengakhiran Perjanjian ini, Para Pihak sepakat untuk mengesampingkan ketentuan- yang tercantum di dalam Pasal 1266 dan Pasal 1267 Kitab Undang-Undang Hukum Perdata Indonesia.")

p8.points << p81
p8.points << p82
p82.points << p821
p82.points << p822
p82.points << p823
p8.points << p83
p8.points << p84

p91 = Point.create(nomor: "9.1", isi: "Masing-masing Pihak adalah badan usaha yang didirikan secara sah berdasarkan hukum yang berlaku di wilayah Republik Indonesia dan telah memiliki seluruh persetujuan, ijin serta pendaftaran yang dipersyaratkan oleh ketentuan hukum yang berlaku, serta tidak sedang dicabut kewenangan bertindaknya menurut hukum yang berlaku untuk menjalankan usahanya, termasuk namun tidak terbatas kepada pembuatan, penandatanganan serta pelaksanaan Perjanjian ini dan dokumen lain yang terkait dengan Perjanjian ini.")
p92 = Point.create(nomor: "9.2", isi: "Masing-masing penandatangan Perjanjian ini adalah pihak yang berwenang atau wakil yang sah dalam mengikatkan dirinya atau badan usahanya (baik badan hukum maupun bukan badan hukum); dalam hal ternyata penanda tangan bukan pihak yang berwenang atau wakil yang sah, maka penandatangan bertanggung jawab secara pribadi.")
p93 = Point.create(nomor: "9.3", isi: "Para Pihak menjamin bahwa dokumen yang diberikan kepada pihak lainnya adalah merupakan dokumen resmi, asli, sah, masih berlaku dan setiap informasi yang tercantum dalam dokumen tersebut adalah benar, sesuai dengan keadaan sebenarnya dan bukan merupakan rekayasa maupun tipu muslihat atau kebohongan serta sesuai dengan ketentuan atau peraturan yang berlaku.")
p94 = Point.create(nomor: "9.4", isi: "Masing-masing Pihak tidak sedang berada dalam sengketa, gugatan, tuntutan, atau diajukan dalam perkara apapun juga; dan tidak (sedang) tunduk pada suatu perintah, pengikatan, larangan, atau keputusan apapun juga; yang kesemuanya yang dapat secara langsung ataupun tidak langsung mempengaruhi pelaksanaan ataupun transaksi sehubungan dengan Perjanjian ini.")
p95 = Point.create(nomor: "9.5", isi: "Para Pihak dengan ini dan untuk seterusnya dikemudian hari membebaskan dan melepaskan Pihak lainnya dari segala gugatan, tuntutan atau tagihan dari siapapun yang tidak langsung berhubungan dengan Perjanjian ini.")

p9.points << p91
p9.points << p92
p9.points << p93
p9.points << p94
p9.points << p95

p101 = Point.create(nomor: "10.1", isi: "Perjanjian ini diatur dan tunduk pada hukum yang berlaku di Negara Republik Indonesia.")
p102 = Point.create(nomor: "10.2", isi: "Apabila dalam pelaksanaan Perjanjian ini terjadi perbedaan pendapat dan/atau penafsiran maupun terjadi perselisihan diantara Para Pihak dalam Perjanjian ini, maka Para Pihak sepakat untuk menyelesaikannya secara musyawarah dengan itikad baik untuk mencapai mufakat. Apabila musyawarah mufakat tidak tercapai, maka Para Pihak sepakat memilih kedudukan hukum yang tetap dan seumumnya di Kantor Kepaniteraan Pengadilan Negeri Jakarta Pusat di Jakarta sebagai sarana penyelesaian perselisihan tersebut.")

p10.points << p101
p10.points << p102

p111 = Point.create(nomor: "11.1", isi: "Para Pihak dinyatakan ingkar janji atau wanprestasi berdasarkan Perjanjian ini, dalam hal melanggar salah satu atau lebih ketentuan-ketentuan Perjanjian ini dan/atau jika tidak melaksanakan ketentuan-ketentuan yang diatur dalam Perjanjian ini")
p112 = Point.create(nomor: "11.2", isi: "Pihak yang wanprestasi akan dikenakan sanksi tertentu sesuai dengan kesepakatan Para Pihak hingga sanksi Pengakhiran Perjanjian.")

p11.points << p111
p11.points << p112

p121 = Point.create(nomor: "12.1", isi: "Para Pihak sepakat bahwa pertukaran informasi yang muncul karena Perjanjian ini dikategorikan sebagai rahasia dan untuk itu Para Pihak sepakat untuk saling menjaga kerahasiaan informasi tersebut kecuali telah mendapatkan izin tertulis dari salah satu pihak lainnya dan/atau informasi tersebut telah berlaku dan diketahui secara umum.")
p122 = Point.create(nomor: "12.2", isi: "Selama Perjanjian ini berlaku maupun setelah berakhirnya Perjanjian ini, Para Pihak dan semua pihak yang bekerja pada/untuk Para Pihak berikut afiliasinya wajib menjaga kerahasiaan data dan/atau informasi dalam bentuk apapun mengenai Pelanggan baik yang diperoleh dari pihak lainnya maupun dari Transaksi Internet melalui Sistem Pembayaran Internet baik yang termasuk sebagai rahasia Bank dan/atau Para Pihak, ataupun hal-hal yang wajib dan sepatutnya dirahasiakan kepada siapapun")

p12.points << p121
p12.points << p122

p131 = Point.create(nomor: "13.1", isi: "Yang dimaksud dengan Force Majeure adalah suatu peristiwa atau keadaan yang terjadi di luar kekuasaan atau kemampuan salah satu atau Para Pihak, yang mengakibatkan salah satu atau Para Pihak tidak dapat melaksanakan hak-hak dan/atau kewajiban-kewajiban sesuai dengan ketentuan-ketentuan di dalam Perjanjian ini, termasuk namun tidak terbatas kepada kebakaran, tidak berfungsinya tenaga listrik untuk jangka waktu lama, putusnya koneksi internet, bencana alam, peperangan, aksi militer, huru-hara, malapetaka, pemogokan, epidemi, dan kebijaksanaan maupun peraturan Pemerintah atau penguasa setempat yang secara langsung dapat mempengaruhi pemenuhan pelaksanaan Perjanjian ini.")
p132 = Point.create(nomor: "13.2", isi: "Dalam hal terjadi Force Majeure, Pihak yang mengalami peristiwa yang dikategorikan sebagai Force Majeure wajib memberikan pemberitahuan secara tertulis tentang hal tersebut kepada Pihak lainnya selambat-lambatnya 7 (tujuh) hari terhitung sejak tanggal terjadinya Force Majeure tersebut, karenanya Para Pihak dengan ini menjadi tidak bertanggung jawab atas kelalaian atau keterlambatan pelaksanaan seluruh atau sebagian Perjanjian ini.")
p133 = Point.create(nomor: "13.3", isi: "Segala permasalahan yang timbul sebagai akibat dari terjadinya Force Majeure tersebut akan diselesaikan secara musyawarah oleh Para Pihak. Dalam hal Force Majeure berkanjut terus-menerus sampai dengan 30 (tiga puluh) hari kalender, maka pihak yang tidak mengalami Force Majeure dapat mengakhiri Perjanjian ini")

p13.points << p131
p13.points << p132
p13.points << p133

p141 = Point.create(nomor: "14.1", isi: "Lampiran. Segala Lampiran, Addendum, Surat Komunikasi, serta dokumen-dokumen lainnya yang dibuat berdasarkan atau sehubungan dengan Perjanjian ini, merupakan bagian integral dari dan menjadi lampiran yang tidak terpisahkan dari Perjanjian ini.")
p142 = Point.create(nomor: "14.2", isi: "Perubahan. Perjanjian ini tidak boleh diubah atau ditambah kecuali disetujui oleh Para Pihak dan termaktub dalam perjanjian formal yang ditandatangani oleh Para Pihak.")
p143 = Point.create(nomor: "14.3", isi: "Addendum. Hal-hal yang tidak atau belum diatur dalam atau perubahan atas Perjanjian ini, akan diatur kemudian melalui addendum yang disepakati dan ditandatangani oleh Para Pihak; addendum mana menjadi bagian integral dan menjadi lampiran yang tidak terpisahkan dari Perjanjian ini.")
p144 = Point.create(nomor: "14.4", isi: "Pelepasan Hak. Dalam hal terjadi kegagalan, penundaan atau keterlambatan oleh salah satu Pihak dalam melaksanakan haknya atau menuntut pemenuhan kewajiban dari Pihak lainnya berdasarkan Perjanjian ini, maka kegagalan, penundaan atau keterlambatan tersebut bukan merupakan pelepasan hak oleh pihak tersebut untuk dikemudian hari melaksanakan haknya atau menuntut pemenuhan kewajiban pihak lainnya berdasarkan Perjanjian.")
p145 = Point.create(nomor: "14.5", isi: "Tidak Ada Pengalihan. Perjanjian ini mengikat dan dibuat untuk kepentingan dari setiap Pihak dan penerima dan/atau pengganti haknya masing-masing, akan tetapi dengan ketentuan, bahwa tidak ada Pihak yang boleh mengalihkan setiap hak-hak yang timbul dari atau berkenaan dengan Perjanjian ini kepada pihak ketiga manapun, tanpa persetujuan tertulis terlebih dahulu dari Pihak lainnya.")

p14.points << p141
p14.points << p142
p14.points << p143
p14.points << p144
p14.points << p145



#seed mock data

dummy_user_merchant = User.create(email: "chris@petani.com", role: "merchant")
dummy_merchant = Merchant.create(name: "Chris", website: "www.chris.com", email: "chris@chris.com", city: "Pamulang", address: "Pamulang Permai", office_status: "1", type_of_product: "Buah-buahan", price_range: "5000-150000", time_since_started: DateTime.parse("09/01/2009 17:00"), ownership_type: 3, revenues_each_month: 5000000, credit_card_payment_ratio: 0.5, registration_link: "test")
dummy_agreement = Agreement.create(pks_number: "dummy_pks", approver_name: "Jaja Miharja", approver_role: "Dokter", has_agree: false)
dummy_channel = AgreementChannel.create(channel_type_id: 1, customprice: "5000")
dummy_doc = MerchantDocument.create(document_type_id: 1)

dummy_user_merchant.merchant = dummy_merchant
dummy_user_merchant.save
dummy_user_merchant.set_password('ppl')
dummy_merchant.agreements << dummy_agreement
dummy_agreement.agreement_channels << dummy_channel
dummy_agreement.merchant_documents << dummy_doc
dummy_merchant.merchant_documents << dummy_doc

dummy_user = User.create(email: 'john@veritrans.com', role: 'sales')
dummy_user.set_password('ppl')

dummy_sales = Sales.create(name: 'John Cena', user: dummy_user)
