class ItemsController < ApplicationController
  before_action :logged_in_user

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "商品が登録されました"
      redirect_to root_url
    else
      render 'items/new'
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description)
    end
end
