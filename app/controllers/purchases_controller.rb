class PurchasesController < ApplicationController
  before_action :set_item

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    ShippingAddress.create(address_params)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit().merge(user_id: current_user.id, item_id: @item.id)
  end

  def address_params
    params.permit(:postal_code, :origin_region_id, :city, :street_number, :building_name, :phone_number).merge(purchase_id: @purchase.id)
  end

end
