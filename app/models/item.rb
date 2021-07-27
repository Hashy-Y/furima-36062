class Item < ApplicationRecord

  belongs_to :user
  has_one    :buy_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition 
  belongs_to_active_hash :postage
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_period

  with_options presence: true do
    validates :item_name
    validates :description
    validates :image
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      validates :price, format: { with: /\A[0-9]+\z/ }
    end
    with_options numericality: { other_than: 1 , message: "can't be blank" } do
      validates :category_id
      validates :condition_id 
      validates :postage_id
      validates :delivery_area_id
      validates :delivery_period_id
    end
  end
end
