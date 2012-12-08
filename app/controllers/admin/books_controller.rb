#coding=utf-8
class Admin::BooksController < ApplicationController
  before_filter do |controller|
    controller.authenticated({:role => 'admin', :alert=>'不具备的权限'})
  end
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
    @book.save ? redirect_to(:action => :index) : render(:template => 'admin/books/form')
  end
  def edit
    @book = Book.find(params[:id])
    render :template => 'admin/books/form'
  end
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book]) ? redirect_to(:action => :index) : render(:template => 'admin/books/form')

  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :action => :index
  end
end
