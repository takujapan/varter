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
