class Item < ApplicationRecord
  with_options presence: true, numericality: { :only_integer, in: 300..9999999 }, format: { with: /\d/ } do
    validates :item_price
  end

  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  # has_one :order

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
