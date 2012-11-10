class Admin::ChaptersController < ApplicationController
  layout 'admin'
  def index
    @chapters = Chapter.where(:book_id => params[:book_id]).includes(:book).order(:number).page(params[:page])
  end
  def new
    @chapter = Chapter.new(:book_id => params[:book_id])
    render :template => 'admin/chapters/form'
  end
  def create
    @chapter = Chapter.new(params[:chapter])
    @chapter.save
    redirect_to :action => :index, :book_id => @chapter.book_id
  end
  def edit
    @chapter = Chapter.find(params[:id])
    render :template => 'admin/chapters/form'
  end
  def destroy
    @chapter = Chapter.find(params[:id])
    @book.destroy
    redirect_to :action => :index
  end
end
