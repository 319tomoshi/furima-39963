class PurchaseAddress
  include ActiveModel::module
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :origin_region_id, :city, :street_number, :building_name, :phone_number
    
  with_options presence: true do
    validates :user_id, :item_id, :purchase_id, :postal_code, :origin_region_id, :city, :street_number, :phone_number
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress(purchase_id: purchase.id, postal_code: postal_code, origin_region_id: origin_region_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number)
  end
end