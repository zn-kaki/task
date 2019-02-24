require 'rails_helper'

describe 'メモ管理機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')}
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')}
    let!(:memo_a) { FactoryBot.create(:memo, name: '最初のメモ', user: user_a) }

    before do
      # 作成者がユーザーAであるメモを作成
      FactoryBot.create(:memo, name: '最初のメモ', user: user_a)
      #ログイン画面にアクセス
      visit login_path
      #メールアドレス入力
      fill_in 'メールアドレス', with: login_user.email
      #パスワード入力
      fill_in 'パスワード', with: login_user.password
      #ログインボタン
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成したメモが表示される' do
        # 作成済みのメモの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初のメモ'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したメモが表示されない' do
        #ユーザーAが作成したメモの対象が画面上に表示されていない
        expect(page).to have_no_content '最初のメモ'
      end
    end
  end
end
