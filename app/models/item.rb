class Item < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true, format: { with: /\A\d[0-9]+\z/, message: "半角数字を入力してください" }, inclusion: { in: 300..9999999, message: "金額は¥300から¥9,999,999までです" }
  validates :description, presence: true

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :region
  belongs_to :day

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
end
