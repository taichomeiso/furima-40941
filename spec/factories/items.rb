FactoryBot.define do
  factory :item do
    item_name           { Faker::Name.initials(number: 2) }
    item_description    { Faker::Lorem.sentence }
    category_id         { Faker::Number.between(from: 1, to: 10) }
    condition_id        { Faker::Number.between(from: 1, to: 6) }
    shipping_cost_id    { Faker::Number.between(from: 1, to: 47) }
    prefecture_id       { Faker::Number.between(from: 1, to: 2) }
    days_to_ship_id     { Faker::Number.between(from: 1, to: 3) }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'sasametop.png')), filename: 'sasametop.png',
                        content_type: 'image/png')
    end
  end
end
