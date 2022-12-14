class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :item_status_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: 'を入力してください' }

  with_options presence: true,
               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                               allow_blank: true }, format: { with: /\d/, allow_blank: true } do
    validates :item_price
  end

  belongs_to :user
  has_one    :order, dependent: :destroy

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
