require 'rails_helper'

RSpec.describe "コメント機能", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:item) { create(:item) }
  let!(:comment) { create(:comment, user_id: user.id, item: item) }

  context "コメントの登録" do
    context "ログインしている場合" do
      before do
        login_for_request(user)
      end

      it "有効な内容のコメントが登録できること" do
        expect {
          post comments_path, params: { item_id: item.id,
                                        comment: { content: "素敵です" } }
        }.to change(item.comments, :count).by(1)
      end

      it "無効な内容のコメントが登録できないこと" do
        expect {
          post comments_path, params: { item_id: item.id,
                                        comment: { content: "" } }
        }.not_to change(item.comments, :count)
      end
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
      context "コメントを作成したユーザーである場合" do
        it "コメントが削除できること" do
          login_for_request(user)
          expect {
            delete comment_path(comment)
          }.to change(item.comments, :count).by(-1)
        end
      end

      context "コメントを作成したユーザーでない場合" do
        it "コメントの削除はできないこと" do
          login_for_request(other_user)
          expect {
            delete comment_path(comment)
          }.not_to change(item.comments, :count)
        end
      end
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
