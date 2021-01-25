class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:item_name_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item.id)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name_id, :status_id).merge(user_id: current_user.id)
  end

end
