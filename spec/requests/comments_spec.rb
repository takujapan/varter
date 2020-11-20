require 'rails_helper'

RSpec.describe "コメント機能", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
  let!(:comment) { create(:comment, user_id: user.id, item: item) }

  context "コメントの登録" do
    context "ログインしている場合" do
    end

    context "ログインしていない場合" do
      it "コメントは登録できず、ログインページへリダイレクトすること" do
        expect {
          post comments_path, params: { item_id: item.id,
                                        comment: { content: "素敵です" } }
        }.not_to change(item.comments, :count)
       expect(response).to redirect_to login_path
      end
    end
  end

  context "コメントの削除" do
    context "ログインしている場合" do
    end

    context "ログインしていない場合" do
      it "コメントは削除できず、ログインページへリダイレクトすること" do
        expect {
          delete comment_path(comment)
        }.not_to change(item.comments, :count)
      end
    end
  end
end
