require "rails_helper"

RSpec.describe "商品編集", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:item) { create(:item, user: user) }

  context "認可されたユーザーの場合" do
    it "レスポンスが正常に表示されること(+フレンドリーフォワーディング)" do
      get edit_item_path(item)
      login_for_request(user)
      expect(response).to redirect_to edit_item_url(item)
      patch item_path(item), params: { item: { name: "Reiwa Drone",
                                               description: "昔買ったドローンです" } }
      redirect_to item
      follow_redirect!
      expect(response).to render_template('items/show')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      # 編集
      get edit_item_path(item)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
      # 更新
      patch item_path(item), params: { item: { name: "Reiwa Drone",
                                               description: "昔買ったドローンです" } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end

  context "別アカウントのユーザーの場合" do
    it "ホーム画面にリダイレクトすること" do
      # 編集
      login_for_request(other_user)
      get edit_item_path(item)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      # 更新
      patch item_path(item), params: { item: { name: "Reiwa Drone",
                                               description: "昔買ったドローンです" } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end
