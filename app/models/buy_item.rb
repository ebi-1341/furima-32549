class BuyItem

  include ActiveModel::Model
  attr_accessor :region_id, :postcode, :city_name, :house_number, :building, :phone_number

  with_options presence: true do
    validates :city_name
    validates :house_number
  end

  validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "10桁か11桁の数字を入力してください"}

  def save
    buy = Buy.create(user_id: user.id, item_id: item.id)
    Address.create(postcode: postcode, region_id: region_id, city_name: city_name, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end