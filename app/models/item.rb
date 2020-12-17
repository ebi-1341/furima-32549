class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :image
    validates :price, format: { with: /\A\d[0-9]+\d[0-9]+\z/, message: '半角数字を入力してください' },
                      inclusion: { in: 300..9_999_999, message: '金額は¥300から¥9,999,999までです' }
    validates :description
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :region
  belongs_to :day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :region_id
    validates :day_id
  end
end
