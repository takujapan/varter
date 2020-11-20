class ItemsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "商品が登録されました"
      redirect_to item_path(@item)
    else
      render 'items/new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "商品情報が更新されました"
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if current_user.admin? || current_user?(@item.user)
      @item.destroy
      flash[:success] = "商品が削除されました"
      redirect_to request.referrer == user_url(@item.user) ? user_url(@item.user) : root_url
    else
      flash[:danger] = "他人の商品は削除できません"
      redirect_to root_url
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :picture)
    end

    def correct_user
      # 現在のユーザーが更新対象の料理を保有しているかどうか確認
      @item = current_user.items.find_by(id: params[:id])
      redirect_to root_url if @item.nil?
    end
end
