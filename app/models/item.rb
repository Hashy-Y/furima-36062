class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
    with_options numericality: { other_than: 1 , message: "can't be blank" } do
      validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
      validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
      validates :postage_id, numericality: { other_than: 1 , message: "can't be blank" }
      validates :delivery_area_id, numericality: { other_than: 1 , message: "can't be blank" }
      validates :delivery_period_id, numericality: { other_than: 1 , message: "can't be blank" }
    end
  end

end
