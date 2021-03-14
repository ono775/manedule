class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

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

  def show
    @item = Item.find(params[:id])
    @schedules = Schedule.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name_id, :status_id).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end
end
