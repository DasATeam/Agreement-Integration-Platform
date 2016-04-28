FactoryGirl.define do
  factory :merchant_owner do |f|
    f.email 'chrisowners@chris.com'
    f.name 'ccc'
    f.address 'jkt'
    f.telephone '021021021'
    # f.references(:merchant, foreign_key: true)
  end
end
