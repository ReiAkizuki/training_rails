class BlogsController < ApplicationController
  def index
    @blogs = current_user.blogs.all
  end

  def show
    id = params[:id]
    begin
      @blog = current_user.blogs.find(id)
    rescue
      render 'errors/404', status: :not_found and return
    end
  end

  def new
    @blog = current_user.blogs.new()
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to :root, notice: 'Blog was successfully created.' and return
    else
      render :new, errors: @blog.errors and return
    end
  end

  def edit
    id = params[:id]
    begin
      @blog = current_user.blogs.find(id)
    rescue
      render 'errors/404', status: :not_found and return
    end
  end

  def update
    id = params[:id]
    begin
      @blog = current_user.blogs.find(id)
    rescue
      render 'errors/404', status: :not_found
    end
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.' and return
    else
      render :edit, errors: @blog.errors and return
    end
  end

  def destroy
    id = params[:id]
    begin
      @blog = current_user.blogs.find(id)
    rescue
      render 'errors  /404', status: :not_found
    end
    @blog.destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
