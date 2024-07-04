FactoryBot.define do
  factory :order_delivery_address do
    postal_code { '810-0001' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipality { '福岡市' }
    house_address { '4-4-11' }
    building_name { '天神ショッパーズ' }
    phone_number { '0927215411' }
    token        { 'tok_abcdefghijk00000000000000000' }

    association :user
    association :item
  end
end
