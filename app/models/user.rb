class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname, presence: true
    validates_format_of :password, with: PASSWORD_REGEX
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください', allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください', allow_blank: true }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: 'は全角カタカナを使用してください', allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: 'は全角カタカナを使用してください', allow_blank: true }
    validates :birthday, presence: true
  end

  has_many :items, dependent: :destroy
  has_many :orders
end
