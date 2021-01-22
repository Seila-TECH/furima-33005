class Form
  include ActiveModel::Model
  attr_accessor :postal,:shipping_erea_id,:adress,:adress_number,:adress_building,:telphone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :shipping_erea_id, numericality: { other_than: 1, message: "Select" }
    validates :adress
    validates :adress_number
    validates :telphone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal: postal, shipping_erea_id: shipping_erea_id, adress: adress, adress_number: adress_number, adress_building: adress_building, telphone_number: telphone_number, purchase_id: purchase.id)
  end

end