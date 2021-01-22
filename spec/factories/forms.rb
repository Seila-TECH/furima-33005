FactoryBot.define do
  factory :form do
    postal                {"000-0000"}
    shipping_erea_id      {Faker::Number.between(from:2, to:48)}
    adress                {"福岡市"}
    adress_number         {"中洲１−１"}
    telphone_number       {12345678901}
    token                 {"tok_abcdefghijk00000000000000000"}
    
  end
end
