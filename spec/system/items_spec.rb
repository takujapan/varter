require 'rails_helper'

RSpec.describe "Items", type: :system do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }

  describe "商品登録ページ" do
    before do
      login_for_system(user)
      visit new_item_path
    end

    context "ページレイアウト" do
      it "「商品登録」の文字列が存在すること" do
        expect(page).to have_content '商品登録'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('商品登録')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content '商品名'
        expect(page).to have_content '説明'
      end
    end

    context "商品登録処理" do
      it "有効な情報で商品登録を行うと商品登録成功のフラッシュが表示されること" do
        fill_in "商品名", with: "Reiwa Drone"
        fill_in "説明", with: "昔買ったドローンです"
        click_button "登録する"
        expect(page).to have_content "商品が登録されました"
      end

      it "無効な情報で商品登録を行うと商品登録失敗のフラッシュが表示されること" do
        fill_in "商品名", with: ""
        fill_in "説明", with: "昔買ったドローンです"
        click_button "登録する"
        expect(page).to have_content "商品名を入力してください"
      end
    end
  end

  describe "商品編集ページ" do
    before do
      login_for_system(user)
      visit item_path(item)
      click_link "編集"
    end

    context "ページレイアウト" do
      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('商品情報の編集')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content '商品名'
        expect(page).to have_content '説明'
      end
    end

    context "商品の更新処理" do
      it "有効な更新" do
        fill_in "商品名", with: "編集:Reiwa Drone"
        fill_in "説明", with: "編集:昔買ったドローンです"
        click_button "更新する"
        expect(page).to have_content "商品情報が更新されました"
        expect(item.reload.name).to eq "編集:Reiwa Drone"
        expect(item.reload.description).to eq "編集:昔買ったドローンです"
      end

      it "無効な更新" do
        fill_in "商品名", with: ""
        click_button "更新する"
        expect(page).to have_content '商品名を入力してください'
        expect(item.reload.name).not_to eq ""
      end
    end
  end

  describe "商品詳細ページ" do
    context "ページレイアウト" do
      before do
        login_for_system(user)
        visit item_path(item)
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title("#{item.name}")
      end

      it "商品情報が表示されること" do
        expect(page).to have_content item.name
        expect(page).to have_content item.description
      end
    end
  end
end
