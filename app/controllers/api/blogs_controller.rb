class Api::BlogsController < ApplicationController
  protect_from_forgery

  def index
    @blogs = Blog.all
    render json: { blogs: @blogs }
  end

  def show
    @blog = Blog.find(params[:id])
    render json: { blog: @blog }
  end

  def create
    # puts "create"
    @blog = Blog.new(blog_params)
    @blog.save
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
  end

  private
  def blog_params #ストロングパラメータ
    params.require(:blog).permit(:title, :body)
  end
end
