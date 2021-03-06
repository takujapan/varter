require 'rails_helper'

RSpec.describe "商品登録", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }
  let(:picture_path) { File.join(Rails.root, 'spec/fixtures/test_item.jpg') }
  let(:picture) { Rack::Test::UploadedFile.new(picture_path) }

  context "ログインしているユーザーの場合" do
    before do
      get new_item_path
      login_for_request(user)
    end

    context "フレンドリーフォワーディング" do
      it "レスポンスが正常に表示されること" do
        expect(response).to redirect_to new_item_url
      end
    end

    it "有効な商品データで登録できること" do
      expect {
        post items_path, params: { item: { name: "Reiwa Drone",
                                           description: "最新のドローンです",
                                           picture: picture } }
      }.to change(Item, :count).by(1)
      follow_redirect!
      expect(response).to render_template('items/show')
    end

    it "無効な商品データでは登録できないこと" do
      expect {
        post items_path, params: { item: { name: "",
                                           description: "最新のドローンです",
                                           picture: picture } }
      }.not_to change(Item, :count)
      expect(response).to render_template('items/new')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get new_item_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end
end
