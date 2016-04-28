FactoryGirl.define do
  factory :merchant_pic do |f|
    f.email 'chrispics@chris.com'
    f.name 'chrispics'
    f.address 'pamulang'
    f.telephone '8704384'
    # f.references(:merchant, foreign_key: true)
  end
end
