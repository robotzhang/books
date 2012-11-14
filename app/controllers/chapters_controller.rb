#coding=utf-8
class ChaptersController < ApplicationController
  before_filter :only => 'show' do |controller|
    controller.authenticated({:alert=>'必须登录才能阅读该章节'})
  end
  def show
    @chapter = Chapter.where(:book_id => params[:book_id], :number => params[:number]).first! # 加!表示未找到则抛出not found异常
    @schedule = Schedule.new(:user_id => current_user.id, :book_id => @chapter.book_id, :chapter_id => @chapter.id)
    @schedule.save
  end
end
