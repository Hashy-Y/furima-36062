class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city, :address_line, :building_name, :phone_number, :item_id, :user_id, :token
 
  with_options presence: true do
    validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address_line
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
    validates :user_id
    validates :item_id 
  end
  
 
 
  def save
    buy_record = BuyRecord.create(item_id: item_id, user_id: user_id)
    delivery_address = DeliveryAddress.create(
    postal_code: postal_code,
    delivery_area_id: delivery_area_id,
    city: city,
    address_line: address_line,
    building_name: building_name,
    phone_number: phone_number,
    buy_record_id: buy_record.id)
  end
end