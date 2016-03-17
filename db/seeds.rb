# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ktp = DocumentType.create(name: "KTP")
npwp = DocumentType.create(name: "NPWP")
siup = DocumentType.create(name: "SIUP")
tdp = DocumentType.create(name: "TDP")
sk = DocumentType.create(name: "SK Menteri")
buktiKantor = DocumentType.create(name: "Tanda Bukti Kepemilikan / Surat Sewa Kantor")

channels = {}
5.times do |i|
  channels[i] = ChannelType.create(category: "Test Channel", name: "Channel #{i}", charge: "Rp 500/transaksi")
end

channels[0].documents << ktp

channels[1].documents << ktp
channels[1].documents << npwp

channels[2].documents << ktp
channels[2].documents << npwp
channels[2].documents << buktiKantor

channels[3].documents << siup
channels[3].documents << tdp
channels[3].documents << buktiKantor

channels[4].documents << siup
channels[4].documents << sk
channels[4].documents << tdp
channels[4].documents << buktiKantor

root = Poin.create(nomor_poin: "0", isi_poin: "")
p1 = Poin.create(nomor_poin: "1", isi_poin: "Definisi")
p2 = Poin.create(nomor_poin: "2", isi_poin: "Proses Pendaftaran dan Persyaratan Merchant")
p3 = Poin.create(nomor_poin: "3", isi_poin: "Hak Dan Kewajiban Payment Gateway")
p4 = Poin.create(nomor_poin: "4", isi_poin: "Hak dan Kewajiban Merchant")
p5 = Poin.create(nomor_poin: "5", isi_poin: "Biaya Transaksi Dan Pembayaran Tagihan")
p6 = Poin.create(nomor_poin: "6", isi_poin: "Penghentian Sementara Layanan Sistem Pembayaran Internet")
p7 = Poin.create(nomor_poin: "7", isi_poin: "Keamanan dan Perlindungan Informasi")
p8 = Poin.create(nomor_poin: "8", isi_poin: "Jangka Waktu Dan Pengakhiran Perjanjian")
p9 = Poin.create(nomor_poin: "9", isi_poin: "Pernyataan Dan Jaminan")
p10 = Poin.create(nomor_poin: "10", isi_poin: "Domisili Hukum dan Penyelesaian Sengketa")
p11 = Poin.create(nomor_poin: "11", isi_poin: "Ingkar Janji (Wanprestasi)")
p12 = Poin.create(nomor_poin: "12", isi_poin: "Kerahasiaan")
p13 = Poin.create(nomor_poin: "13", isi_poin: "Keadaan Memaksa (Force Majeure)")
p14 = Poin.create(nomor_poin: "14", isi_poin: "Ketentuan Lainnya")

root.poins << p1
root.poins << p2
root.poins << p3
root.poins << p4
root.poins << p5
root.poins << p6
root.poins << p7
root.poins << p8
root.poins << p9
root.poins << p10
root.poins << p11
root.poins << p12
root.poins << p13
root.poins << p14

p11 = Poin.create(nomor_poin: "1.1", isi_poin: "Bank adalah badan hukum yang bergerak di bidang perbankan dan didirikan berdasarkan hukum Indonesia, yang dalam hal ini memiliki fungsi sebagai penyedia jasa sarana Layanan Pembayaran. Daftar nama Bank serta jenis ")
p12 = Poin.create(nomor_poin: "1.2", isi_poin: "Biaya Transaksi adalah biaya yang dikenakan oleh Payment Gateway kepada Merchant untuk setiap Transaksi Internet berhasil, yang perhitungannya diatur lebih lanjut di dalam Lampiran 2 Perjanjian ini.")
p13 = Poin.create(nomor_poin: "1.3", isi_poin: "Hari Kerja adalah hari selain Sabtu, Minggu dan hari libur nasional, di mana bank-bank di Indonesia buka dan operasional untuk kegiatan sehari-hari.")
p14 = Poin.create(nomor_poin: "1.4", isi_poin: "Layanan Pembayaran adalah jenis-jenis metode pembayaran Transaksi Internet yang tersedia di Sistem Pembayaran Internet. Metode pembayaran yang dimaksud akan dijelaskan lebih lanjut di dalam Lampiran 1 Perjanjian ini." )
p15 = Poin.create(nomor_poin: "1.5", isi_poin: "Pelanggan adalah pelaku Transaksi Internet di Merchant, melalui Sistem Pembayaran Internet." )
p16 = Poin.create(nomor_poin: "1.6", isi_poin: "Refund adalah pengembalian dana Transaksi Internet kepada Pelanggan karena pembatalan atas Transaksi Internet tersebut.")
p17 = Poin.create(nomor_poin: "1.7", isi_poin: "Sistem Pembayaran Internet adalah sistem pembayaran yang dimiliki dan dikelola oleh Payment Gateway, yang menghubungkan antara Bank/Service Provider, Payment Gateway, dan Merchant.")
p18 = Poin.create(nomor_poin: "1.8", isi_poin: "Service Provider adalah penyedia jasa metode pembayaran selain Bank, yang memiliki kerjasama dan telah terhubung dengan Payment Gateway. Daftar nama Service Provider serta Layanan Pembayaran yang digunakan akan dicantum di dalam Lampiran 1 Perjanjian ini.")
p19 = Poin.create(nomor_poin: "1.9", isi_poin: "Transaksi Internet adalah transaksi melalui media elektronik yang dilakukan oleh Pelanggan di situs Merchant, dan diproses oleh Sistem Pembayaran Internet.")

p21 = Poin.create(nomor_poin: "2.1", isi_poin: "Merchant setuju untuk memberikan salinan dari dokumen-dokumen resmi yang daftarnya dicantum di Lampiran 4 Perjanjian ini, sebagai persyaratan administratif Perjanjian ini.")
p22 = Poin.create(nomor_poin: "2.2", isi_poin: "Transaksi Internet hanya dapat dilakukan melalui situs Merchant, dengan alamat URL dan/atau mobile apps : ")
p23 = Poin.create(nomor_poin: "2.3", isi_poin: "Merchant berjanji untuk tidak menjual barang atau jasa yang melanggar hukum/peraturan perundang-undangan/ketertiban umum dan/atau yang secara spesifik dilarang oleh Bank, Service Provider atau Principal.")
p24 = Poin.create(nomor_poin: "2.4", isi_poin: "Payment Gateway dapat menolak memberikan layanan kepada Merchant dengan kategori sebagai berikut:")
p241 = Poin.create(nomor_poin: "2.4.1", isi_poin: "terlibat tindakan kriminal atau melanggar norma hukum, social, agama dan moral;")
p242 = Poin.create(nomor_poin: "2.4.2", isi_poin: "terlibat dalam kelompok atau organisasi terlarang;")
p243 = Poin.create(nomor_poin: "2.4.3", isi_poin: "masuk ke dalam daftar hitam Payment Gateway, Bank atau Service Provider.")
p25 = Poin.create(nomor_poin: "2.4.5", isi_poin: "2.4.	Merchant wajib memberikan pemberitahuan tertulis kepada Payment Gateway apabila Merchant merubah jenis usaha dan/atau jenis barang atau jasa yang ditawarkan melalui situs Merchant, serta dalam hal terjadi perubahan dalam susunan kepemilikan, Direksi atau penanggungjawab Merchant, sekurang-kurangnya 14 (empat belas) Hari Kerja sebelum perubahan tersebut dilakukan.")

p24.poins << p241
p24.poins << p242
p24.poins << p243

p31 = Poin.create(nomor_poin: "3.1", isi_poin: "Hak Payment Gateway, selain hak-hak yang telah dinyatakan dalam pasal-pasal lain Perjanjian ini adalah menerima pembayaran Biaya Transaksi untuk setiap Transaksi Internet yang berhasil, yang perhitungannya diatur di dalam Lampiran 2 Perjanjian ini.")
p32 = Poin.create(nomor_poin: "3.2", isi_poin: "Kewajiban Payment Gateway, selain kewajiban-kewajiban yang telah dinyatakan dalam pasal-pasal lain Perjanjian ini adalah:")
p321 = Poin.create(nomor_poin: "3.2.1", isi_poin: "mengelola dan merawat Sistem Pembayaran Internet agar tetap lancar dan operasional;")
p322 = Poin.create(nomor_poin: "3.2.2", isi_poin: "menyediakan rekonsiliasi data Transaksi Internet untuk Merchant;")
p323 = Poin.create(nomor_poin: "3.2.3", isi_poin: "memberikan informasi kepada Merchant akan status Transaksi Internet;")
p324 = Poin.create(nomor_poin: "3.2.4", isi_poin: "memberikan dukungan teknis atau operasional kepada Merchant apabila diperlukan;")
p325 = Poin.create(nomor_poin: "3.2.5", isi_poin: "menyiapkan Prosedur Operasi Standar (Standard Operating Procedure) untuk kebutuhan operasional layanan Sistem Pembayaran Internet antara Merchant dan Payment Gateway sebagaimana diatur dalam lampiran 6 Perjanjian; dan")
p326 = Poin.create(nomor_poin: "3.2.6", isi_poin: "mematuhi ketentuan dan persyaratan dari masing-masing Layanan Pembayaran yang telah ditetapkan oleh Bank dan Service Provider.")

p32.poins << p321
p32.poins << p322
p32.poins << p323
p32.poins << p324
p32.poins << p325
p32.poins << p326

p41 = Poin.create(nomor_poin: "4.1", isi_poin: "mendapatkan dukungan teknis maupun operasional dari Payment Gateway;")
p411 = Poin.create(nomor_poin: "4.1.1", isi_poin: "mendapatkan dukungan teknis maupun operasional dari Payment Gateway;")
p412 = Poin.create(nomor_poin: "4.1.2", isi_poin: "menerima informasi status Transaksi Internet; dan")
p413 = Poin.create(nomor_poin: "4.1.3", isi_poin: "menerima edukasi terkait akan penyelenggaraan layanan Sistem Pembayaran Internet.")

p41.poins << p411
p41.poins << p412
p41.poins << p413

p42 = Poin.create(nomor_poin: "4.2", isi_poin: "Kewajiban Merchant, selain kewajiban-kewajiban yang telah dinyatakan dalam pasal-pasal lain Perjanjian ini adalah:")
p421 = Poin.create(nomor_poin: "4.2.1", isi_poin: "melakukan pembayaran kepada Payment Gateway atas Biaya Transaksi sebagaimana diatur di dalam Lampiran 2 Perjanjian ini;")
p422 = Poin.create(nomor_poin: "4.2.2", isi_poin: "menampilkan ketentuan bertransaksi sebagai panduan bagi Pelanggan;")
p423 = Poin.create(nomor_poin: "4.2.3", isi_poin: "menyimpan bukti Transaksi Internet selama sekurang-kurangnya 24 (dua puluh empat) bulan setelah tanggal terjadinya Transaksi Internet;")
p424 = Poin.create(nomor_poin: "4.2.4", isi_poin: "memiliki kebijakan pengembalian dana (chargeback) Transaksi Internet atau Refund; dan")
p425 = Poin.create(nomor_poin: "4.2.5", isi_poin: "mematuhi ketentuan dan persyaratan dari masing-masing Layanan Pembayaran yang telah ditetapkan oleh Bank dan Service Provider.")

p42.poins << p421
p42.poins << p422
p42.poins << p423
p42.poins << p424
p42.poins << p425

p51 = Poin.create(nomor_poin: "5.1", isi_poin: "Merchant wajib membayar Biaya Transaksi kepada Payment Gateway untuk setiap Transaksi Internet yang berhasil dengan rincian biaya sebagaimana yang dicantumkan di Lampiran 2 Perjanjian ini.")
p52 = Poin.create(nomor_poin: "5.2", isi_poin: "Tata cara pembayaran Biaya Transaksi dan/atau tagihan lainnya diatur dalam Lampiran 3 Perjanjian ini.")

p61 = Poin.create(nomor_poin: "6.1", isi_poin: "Payment Gateway dapat setiap saat menghentikan/mematikan Sistem Pembayaran Internet untuk sementara waktu dengan pemberitahuan selambat-lambatnya 5 (lima) Hari Kerja sebelumnya kepada Merchant.")
p62 = Poin.create(nomor_poin: "6.2", isi_poin: "Penghentian layanan Sistem Pembayaran Internet dapat disebabkan oleh alasan-alasan sebagai berikut: ")
p621 = Poin.create(nomor_poin: "6.3", isi_poin: "inspeksi, perbaikan, pemeliharaan atau peningkatan sistem;")
p622 = Poin.create(nomor_poin: "6.2.2", isi_poin: "adanya alasan tertentu berupa melindungi hak-hak dan/atau kepentingan Para Pihak; ")
p623 = Poin.create(nomor_poin: "6.2.3", isi_poin: "alasan jelas lain yang ditentukan oleh Payment Gateway, Bank, atau Service Provider.")
p63 = Poin.create(nomor_poin: "6.3", isi_poin: "Apabila terdapat gangguan tiba-tiba terhadap Sistem Pembayaran Internet akibat kegagalan sistem, jaringan, koneksi internet atau alasan lainnya, Payment Gateway akan memberitahu Merchant secara tertulis mengenai gangguan ini, serta informasi lanjutan apabila gangguan tersebut telah selesai.")

p62.poins << p621
p62.poins << p622
p62.poins << p623

p71 = Poin.create(nomor_poin: "7.1", isi_poin: "Payment Gateway memiliki sistem dan jaringan yang aman guna melindungi informasi yang bersifat sensitif, termasuk namun tidak terbatas kepada:")
p711 = Poin.create(nomor_poin: "7.1.1", isi_poin: "informasi Transaksi Internet (nomor kartu, user id Pelanggan, dan lain-lain);")
p712 = Poin.create(nomor_poin: "7.1.2", isi_poin: "informasi Pelanggan (data pribadi, alamat, dan lain-lain); dan")
p713 = Poin.create(nomor_poin: "7.1.3", isi_poin: "informasi lainnya yang dianggap sensitif oleh Para Pihak.")
p72 = Poin.create(nomor_poin: "7.2", isi_poin: "Payment Gateway akan menyimpan dan melindungi data Transaksi Internet selama 24 (dua puluh empat) bulan setelah tanggal terjadinya Transaksi Internet tersebut.")

p71.poins << p711
p71.poins << p712
p71.poins << p713




#
# p1 = Pasal.create(nomor_pasal: "1", nama_pasal: "Definisi")
# p2 = Pasal.create(nomor_pasal: "2", nama_pasal: "Proses Pendaftaran dan Persyaratan Merchant")
# p3 = Pasal.create(nomor_pasal: "3", nama_pasal: "Hak Dan Kewajiban Payment Gateway
# ")
# p4 = Pasal.create(nomor_pasal: "4", nama_pasal: "Hak dan Kewajiban Merchant
# ")
# p5 = Pasal.create(nomor_pasal: "5", nama_pasal: "Biaya Transaksi Dan Pembayaran Tagihan
# ")
# p6 = Pasal.create(nomor_pasal: "6", nama_pasal: "Penghentian Sementara Layanan Sistem Pembayaran Internet
# ")
# p7 = Pasal.create(nomor_pasal: "7", nama_pasal: "Keamanan dan Perlindungan Informasi
# ")
# p8 = Pasal.create(nomor_pasal: "8", nama_pasal: "Jangka Waktu Dan Pengakhiran Perjanjian
# ")
# p9 = Pasal.create(nomor_pasal: "9", nama_pasal: "Pernyataan Dan Jaminan
# ")
# p10 = Pasal.create(nomor_pasal: "10", nama_pasal: "Domisili Hukum dan Penyelesaian Sengketa
# ")
# p11 = Pasal.create(nomor_pasal: "11", nama_pasal: "Ingkar Janji (Wanprestasi)
# ")
# p12 = Pasal.create(nomor_pasal: "12", nama_pasal: "Kerahasiaan
# ")
# p13 = Pasal.create(nomor_pasal: "13", nama_pasal: "Keadaan Memaksa (Force Majeure)
# ")
# p14 = Pasal.create(nomor_pasal: "14", nama_pasal: "Ketentuan Lainnya
# ")
