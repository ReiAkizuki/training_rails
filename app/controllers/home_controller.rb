# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @blogs = current_user.blogs.all
  end
end
