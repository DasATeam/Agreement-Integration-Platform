FactoryGirl.define do
  factory :merchant do |f|
    f.name 'Chris'
    f.website 'www.chris.com'
    f.email 'chris@chris.com'
    f.city 'Pamulang'
    f.address 'Pamulang Permai'
    f.office_status '1'
    f.type_of_product 'Buah-buahan'
    f.price_range '5000-150000'
    f.time_since_started '2009-01-09'
    f.ownership_type '3'
    f.revenues_each_month '500000'
    f.credit_card_payment_ratio '0.5'
    f.registration_link 'jfjfjf.fkfkf.vom'
  end
end
