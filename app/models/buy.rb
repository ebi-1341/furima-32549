class buy
  include ActiveModel::Model
  attr_accessor :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :name, :price, :description,
  :category_id, :condition_id, :burden_id, :region_id, :day_id, :postcode, :city_name, :house_number, :building, :phone_number,
  
  ## addressesテーブルのバリデーション
  validates :postcode, presence: true
  validates :city_name, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true
  validates :purcahse, foreign_key: true
  ## itemテーブルのバリデーション
  with_options presence: true do
    validates :name
    validates :image
    validates :price, format: { with: /\A\d[0-9]+\d[0-9]+\z/, message: '半角数字を入力してください' },
                      inclusion: { in: 300..9_999_999, message: '金額は¥300から¥9,999,999までです' }
    validates :description
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :region_id
    validates :day_id
  end
  ## userテーブルのバリデーション
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birthday, presence: true

  def save
    user = User.create(nickname: nickname, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birthday: birthday)
    item = Item.create(name: name, price: price, description: description, category_id: category_id, burden_id: burden_id, condition_id: condition_id, region_id: region_id, day_id: day_id, user_id: user.id)
    buy = Buy.create(user_id: user.id)
    Address.create(postcode: postcode, region_id: region_id, city_name: city_name, house_number: house_number, building: building, phone_number: phone_number, user_id: user.id)
  end
end