class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :region

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  
end
