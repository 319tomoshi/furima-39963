class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @article.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :condition_id, :shpping_fee_paid_by_id, :origin_region_id, :shiopping_day_id)
  end

end
