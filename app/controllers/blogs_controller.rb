# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :fetch_current_blog, only: %i[show edit update destroy]

  def index
    @blogs = current_user.blogs.all
  end

  def show; end

  def new
    @blog = current_user.blogs.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_path(@blog), notice: 'Blog was successfully created.' and return }
        format.json { render json: @blog, status: :ok, notice: 'Blog was successfully created.' and return }
      else
        format.html { render :new and return }
        format.json { render json: @blog.errors, status: :unprocessable_entity and return }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_path(@blog), notice: 'Blog was successfully updated.' and return }
        format.json { render json: @blog, status: :ok, notice: 'Blog was successfully updated.' and return }
      else
        format.html { render :edit and return }
        format.json { render json: @blog.errors, status: :unprocessable_entity and return }
      end
    end
  end

  def destroy
    @blog.destroy
  end

  private

  def fetch_current_blog
    @blog = current_user.blogs.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
