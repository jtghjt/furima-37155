class Item < ApplicationRecord
  # 各モデルのアソシエーション
  belongs_to :user
  has_one :order

  # ActiveStorageのアソシエーション
  has_one_attached :image

  # ActivaHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
