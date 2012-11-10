class Admin::BooksController < ApplicationController
  layout 'admin'
  def index
    @books = Book.order(:id).page(params[:page])
  end
  def new
    @book = Book.new
    render :template => 'admin/books/form'
  end
  def create
    @book = Book.new(params[:book])
    @book.save
    redirect_to :action => :index
  end
  def edit
    @book = Book.find(params[:id])
    render :template => 'admin/books/form'
  end
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    redirect_to :action => :index
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :action => :index
  end
end
