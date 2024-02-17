class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :condition_id, :shipping_fee_paid_by_id,
                                 :origin_region_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
