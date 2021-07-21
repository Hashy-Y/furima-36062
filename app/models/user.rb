class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, format: { with: PASSWORD_REGIX}, allow_blank: true
  validates :password_confirmation, format: { with: PASSWORD_REGIX }, allow_blank: true
  NAME_REGIX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name, presence: true, format: { with: NAME_REGIX, allow_blank: true }
  validates :last_name, presence: true, format: { with: NAME_REGIX, allow_blank: true }
  NAME_KANA_REGIX = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGIX, allow_blank: true }
  validates :last_name_kana, presence: true, format: { with: NAME_KANA_REGIX, allow_blank: true }
  validates :birthday, presence: true
end
