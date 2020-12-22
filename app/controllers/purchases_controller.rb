class PurchasesController < ApplicationController
  def index
    @purchase = BuyItem.new
    @item = Item.find(params[:item_id])
  end


  def create
  end
  
end
