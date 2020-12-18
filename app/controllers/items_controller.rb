class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :create]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :image, :category_id, :condition_id, :burden_id, :region_id,
                                 :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
