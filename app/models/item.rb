class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_profile
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000 }
    with_options numericality: { other_than: 1, message: "Select" } do
      validates :category_id
      validates :item_status_id
      validates :shipping_fee_id
      validates :shipping_erea_id
      validates :shipping_date_id
    end
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :shipping_date
  belongs_to :shipping_erea

end
