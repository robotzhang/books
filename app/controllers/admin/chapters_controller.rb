#coding=utf-8
class Admin::ChaptersController < ApplicationController
  layout 'admin'
  def index
    @chapters = Chapter.where(:book_id => params[:book_id]).includes(:book).order(:number).page(params[:page])
  end
  def new
    @chapter = Chapter.new(:book_id => params[:book_id], :number => params[:number])
    render :template => 'admin/chapters/form'
  end
  def create
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      redirect_to new_admin_chapter_url(:book_id => @chapter.book_id, :number => @chapter.number + 1), :alert => '第'+@chapter.number.to_s+'章添加成功'
    else
      render :template => 'admin/chapters/form'
    end
  end
  def edit
    @chapter = Chapter.find(params[:id])
    render :template => 'admin/chapters/form'
  end
  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chapter])
      redirect_to admin_chapters_url(:book_id => @chapter.book_id, :number => @chapter.number), :alert => '第'+@chapter.number.to_s+'章更新成功'
    else
      render :template => 'admin/chapters/form'
    end
  end
  def destroy
    @chapter = Chapter.find(params[:id])
    @book.destroy
    redirect_to :action => :index
  end
end
