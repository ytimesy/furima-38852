class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :city
    validates :address
    validates :tel,       format:{with: /\A[\d]{10,11}\z/, message: "can't be blank"}
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 配送先を保存する
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, purchase_id: purchase.id)
  end
end