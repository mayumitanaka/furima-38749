class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :phone_number, :token

  with_options presence: true do
    validates :token, presence: true
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid', allow_blank: true }
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid', allow_blank: true }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
