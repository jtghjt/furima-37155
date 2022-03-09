class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipalities, :address, :building, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is Invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end