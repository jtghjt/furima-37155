class Item < ApplicationRecord
  # 各モデルのアソシエーション
  belongs_to :user

  # ActiveStorageのアソシエーション
  has_one_attached :image

  # ActivaHAshのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date
end
