class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_items, only: [:show, :edit, :update]

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
    @schedules = Schedule.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name_id, :status_id).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end
end
