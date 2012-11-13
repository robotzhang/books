#coding=utf-8
class ChaptersController < ApplicationController
  before_filter :only => 'show' do |controller|
    controller.authenticated('必须登录才能查看')
  end
  def show
    @chapter = Chapter.find(params[:id], :include => 'book')
    @schedule = Schedule.new(:user_id => current_user.id, :book_id => @chapter.book_id, :chapter_id => @chapter.id)
    @schedule.save
  end
end
