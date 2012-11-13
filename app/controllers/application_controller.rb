#coding=utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  # 首页
  def homepage
    @books = Book.all(:limit=>10)
    render :template => 'homepage'
  end

  # 登录验证
  def authenticated(alert=nil)
    unless current_user
      redirect_to login_url, :alert => alert || '请先登陆'
      return false
    end
    true
  end

  # 当前登录用户
  def current_user
    session[:user]
  end
end
