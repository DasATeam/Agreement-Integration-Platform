FactoryGirl.define do
  factory :merchant_operational do |f|
    f.email 'chrisowners@chris.com'
    f.telephone '021021021'
    f.emergency '12345'
    # f.references(:merchant, foreign_key: true)
  end
end
