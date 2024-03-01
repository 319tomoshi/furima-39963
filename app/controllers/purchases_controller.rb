class PurchasesController < ApplicationController
  before_action :set_item
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :origin_region_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
