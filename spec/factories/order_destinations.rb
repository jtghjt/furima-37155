FactoryBot.define do
  factory :order_destination do
    postcode { '123-4567' }
    prefecture_id { 2 }
    municipalities { '福岡市' }
    address { '1-1' }
    building { 'ハイツ' }
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
