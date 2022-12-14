class Api::BooksController < ApplicationController
  protect_from_forgery :except => [:create, :update, :destroy]

  def index
    @books = Book.all
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    @book = Book.find(params[:id])
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.fetch(:book, {}).permit(
      :title, :author, :publisher, :genre
    )
  end
end
