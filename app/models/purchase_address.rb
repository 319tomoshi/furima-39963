class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :origin_region_id, :city, :street_number, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :street_number, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, numericality: { only_integer: true, message: 'must be an integer' },
                             length: { minimum: 10, maximum: 11, message: 'must be 10 to 11 digits' }
  end
  validates :origin_region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id:, item_id:)
    ShippingAddress.create(purchase_id: purchase.id, postal_code:, origin_region_id:, city:,
                           street_number:, building_name:, phone_number:)
  end
end
