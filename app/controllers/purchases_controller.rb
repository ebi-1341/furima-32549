class PurchasesController < ApplicationController
  def index
    @buy_item = BuyItem.new
    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new(purchase_params)
    if @buy_item.valid?
      @buy_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:buy_item).permit(:postcode, :region_id, :city_name, :house_number, :building, :phone_number, :hoge).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
