class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :birthday
    validates :email, uniqueness: { case_sensitive: true }
    validates :password, confirmation: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end

  has_many :items
  has_many :purchases

end
