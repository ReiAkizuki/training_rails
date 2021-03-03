# frozen_string_literal: true

require 'rails_helper'

RSpec.feature '/' do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  before do
    # トップページを開く
    visit root_path
    # ログインフォームにEmailとパスワードを入力する
    fill_in 'Email',    with: user1.email
    fill_in 'Password', with: user1.password
    # ログインボタンをクリックする
    click_on 'Log in'
  end

  let!(:blog1) { create(:blog, user: user1) }
  let!(:blog2) { create(:blog, user: user1) }
  let!(:blog3) { create(:blog, user: user2) }
  let!(:blog4) { create(:blog, user: user2) }

  feature 'ブログ一覧' do
    context 'ログインユーザの場合' do
      it '自分に紐づくBlogだけが表示されること' do
        expect(page).to     have_link blog1.title, **{ href: blog_path(blog1) }
        expect(page).to     have_link blog2.title, **{ href: blog_path(blog2) }
        expect(page).not_to have_link blog3.title, **{ href: blog_path(blog3) }
        expect(page).not_to have_link blog4.title, **{ href: blog_path(blog4) }
      end
    end

    context 'ログインユーザでない場合' do
      click_on 'ログアウト'
      it 'ログインが求められること' do
        visit root_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
  end
end
