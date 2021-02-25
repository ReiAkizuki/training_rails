# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BlogsController', type: :request do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:blog1) { create(:blog, user: user1) }
  let(:blog2) { create(:blog, user: user1) }
  let(:blog3) { create(:blog, user: user2) }
  let(:blog4) { create(:blog, user: user2) }

  before do
    sign_in user1
  end

  describe 'GET Blogs#index' do
    before do
      get blogs_path
    end

    context 'ログインユーザの場合' do
      it '自分に紐づくBlogだけが表示されること' do
        expect(response.response_code).to eq(200)
        expect(controller.instance_variable_get(:@blogs)).to eq user1.blogs
      end
    end

    context 'ログインユーザでない場合' do
    end
  end

  describe 'GET Blogs#show' do
    context 'ログインユーザの場合' do
      it '自分に紐づくBlogが表示されること' do
        get blog_path(blog1)
        expect(response.response_code).to eq(200)
        expect(controller.instance_variable_get(:@blog)).to eq blog1
      end
      it '自分に紐づかないBlogが表示されないこと' do
        get blog_path(blog3)
        expect(response.response_code).to eq(404)
      end
    end

    context 'ログインユーザでない場合' do
    end
  end
end
