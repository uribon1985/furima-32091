FactoryBot.define do
  factory :item do
    name                    {'ddd'}
    category_id             {3}
    product_condition_id    {2}
    shipping_charges_id     {2}
    shipping_area_id        {11}
    estimated_shipping_id   {4}
    product_description     {'ddddjjjj'}
    price                   {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/flag.png'), filename: 'flag.png')
    end
  end
end


    #association :user

    #content {Faker::Lorem.sentence}
    #association :

