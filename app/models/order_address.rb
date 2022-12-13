class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :phone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :street, presence: true

  with_options presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} do
    validates :post_code
  end

  with_options presence: true, format: {with: /\A[0]\d{9,10}\z/, message: "is invalid."} do
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end