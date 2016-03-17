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



