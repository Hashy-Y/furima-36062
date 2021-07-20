class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  NAME_REGIX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: { with: NAME_REGIX }
  validates :last_name, presence: true, format: { with: NAME_REGIX }
  NAME_KANA_REGIX = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGIX }
  validates :last_name_kana, presence: true, format: { with: NAME_KANA_REGIX }
  validates :birthday, presence: true
end
