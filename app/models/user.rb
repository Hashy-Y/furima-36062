class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, allow_blank: true} do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
  with_options format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, allow_blank: true} do
    validates :password
    validates :password_confirmation
  end
  
end
