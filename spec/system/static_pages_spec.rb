require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "Varterの文字列が存在することを確認" do
        expect(page).to have_content 'Varter'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title
      end

      context "商品フィード", js: true do
        let!(:user) { create(:user) }
        let!(:item) { create(:item, user: user) }

        before do
          login_for_system(user)
        end

        it "商品のページネーションが表示されること" do
          login_for_system(user)
          create_list(:item, 6, user: user)
          visit root_path
          expect(page).to have_content "みんなの商品 (#{user.items.count})"
          expect(page).to have_css "div.pagination"
          Item.take(5).each do |i|
            expect(page).to have_link i.name
          end
        end

        it "「出品する」リンクが表示されること" do
          visit root_path
          expect(page).to have_link "出品する", href: new_item_path
        end

        it "商品を削除後、削除成功のフラッシュが表示されること" do
          visit root_path
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '商品が削除されました'
        end
      end
    end

    context "ヘルプページ" do
      before do
        visit about_path
      end

      it "Varterとは？の文字列が存在することを確認" do
        expect(page).to have_content 'Varterとは？'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('Varterとは？')
      end
    end
  end
end
