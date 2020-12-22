class BuyItem

  include ActiveModel::Model
  attr_accessor :region_id, :postcode, :city_name, :house_number, :building, :phone_number, :hoge, :user_id, :item_id

  with_options presence: true do
    validates :city_name
    validates :house_number
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "10桁か11桁の数字を入力してください"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, region_id: region_id, city_name: city_name, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end