require 'rails_helper'

RSpec.describe "Items", type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:item) { create(:item, :picture, user: user) }
  let!(:comment) { create(:comment, user_id: user.id, item: item) }

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
        attach_file "item[picture]", "#{Rails.root}/spec/fixtures/test_item.jpg"
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
        attach_file "item[picture]", "#{Rails.root}/spec/fixtures/test_item2.jpg"
        click_button "更新する"
        expect(page).to have_content "商品情報が更新されました"
        expect(item.reload.name).to eq "編集:Reiwa Drone"
        expect(item.reload.description).to eq "編集:昔買ったドローンです"
        expect(item.reload.picture.url).to include "test_item2.jpg"
      end

      it "無効な更新" do
        fill_in "商品名", with: ""
        click_button "更新する"
        expect(page).to have_content '商品名を入力してください'
        expect(item.reload.name).not_to eq ""
      end
    end

    context "商品の削除処理", js: true do
      it "削除成功のフラッシュが表示されること" do
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '商品が削除されました'
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
        expect(page).to have_link nil, href: item_path(item), class: 'item-picture'
      end
    end

    context "商品の削除", js: true do
      it "削除成功のフラッシュが表示されること" do
        login_for_system(user)
        visit item_path(item)
        within find('.change-item') do
          click_on '削除'
        end
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '商品が削除されました'
      end
    end

    context "コメントの登録&削除" do
      it "自分の商品に対するコメントの登録&削除が正常に完了すること" do
        login_for_system(user)
        visit item_path(item)
        fill_in "comment_content", with: "素敵な人に巡り会えますように"
        click_button "コメント"
        within find("#comment-#{Comment.last.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: '素敵な人に巡り会えますように'
        end
        expect(page).to have_content "コメントを追加しました"
        click_link "削除", href: comment_path(Comment.last)
        expect(page).not_to have_selector 'span', text: '素敵な人に巡り会えますように'
        expect(page).to have_content "コメントを削除しました"
      end

      it "別ユーザーの商品のコメントには削除リンクがないこと" do
        login_for_system(other_user)
        visit item_path(item)
        within find("#comment-#{comment.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: comment.content
          expect(page).not_to have_link '削除', href: item_path(item)
        end
      end
    end
  end

  context "検索機能" do
    context "ログインしている場合" do
      before do
        login_for_system(user)
        visit root_path
      end

      it "ログイン後の各ページに検索窓が表示されていること" do
        expect(page).to have_css 'form#item_search'
        visit about_path
        expect(page).to have_css 'form#item_search'
        visit users_path
        expect(page).to have_css 'form#item_search'
        visit user_path(user)
        expect(page).to have_css 'form#item_search'
        visit edit_user_path(user)
        expect(page).to have_css 'form#item_search'
        visit following_user_path(user)
        expect(page).to have_css 'form#item_search'
        visit followers_user_path(user)
        expect(page).to have_css 'form#item_search'
        visit items_path
        expect(page).to have_css 'form#item_search'
        visit item_path(item)
        expect(page).to have_css 'form#item_search'
        visit new_item_path
        expect(page).to have_css 'form#item_search'
        visit edit_item_path(item)
        expect(page).to have_css 'form#item_search'
      end

      it "フィードの中から検索ワードに該当する結果が表示されること" do
        create(:item, name: 'SenseFly eBee Classic', user: user)
        create(:item, name: 'SenseFly eBee X', user: other_user)
        create(:item, name: 'Delair DT26E Surveillance', user: user)
        create(:item, name: 'Delair DT26E LiDAR', user: other_user)

        # 誰もフォローしない場合
        fill_in 'q_name_cont', with: 'Sen'
        click_button '検索'
        expect(page).to have_css 'h3', text: "”Sen”の検索結果：1件"
        within find('.items') do
          expect(page).to have_css 'li', count: 1
        end
        fill_in 'q_name_cont', with: 'Del'
        click_button '検索'
        expect(page).to have_css 'h3', text: "”Del”の検索結果：1件"
        within find('.items') do
          expect(page).to have_css 'li', count: 1
        end

        # other_userをフォローする場合
        user.follow(other_user)
        fill_in 'q_name_cont', with: 'Sen'
        click_button '検索'
        expect(page).to have_css 'h3', text: "”Sen”の検索結果：2件"
        within find('.items') do
          expect(page).to have_css 'li', count: 2
        end
        fill_in 'q_name_cont', with: 'Del'
        click_button '検索'
        expect(page).to have_css 'h3', text: "”Del”の検索結果：2件"
        within find('.items') do
          expect(page).to have_css 'li', count: 2
        end
      end

      it "検索ワードを入れずに検索ボタンを押した場合、商品一覧が表示されること" do
        fill_in 'q_name_cont', with: ''
        click_button '検索'
        expect(page).to have_css 'h3', text: "商品一覧"
        within find('.items') do
          expect(page).to have_css 'li', count: Item.count
        end
      end
    end

    context "ログインしていない場合" do
      it "検索窓が表示されないこと" do
        visit root_path
        expect(page).not_to have_css 'form#item_search'
      end
    end
  end
end
