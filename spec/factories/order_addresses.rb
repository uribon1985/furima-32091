FactoryBot.define do
  factory :order_address do
    postal_code        {'123-1234'}
    shipping_area_id   {2}
    municipality       {'ddddjjjj'}
    phone_number       {'012345611'}
    address            {'hahahahaha'}
    building_name      {'dadadadada'}
    token              {'1231231231231231'}
    #order_id
  end
end
