#coding=utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  # 首页
  def homepage
    @books = Book.all(:limit=>10)
    render :template => 'homepage'
  end

  # 登录验证
  def authenticated(options)
    default ={
        :role => '',
        :alert => '请先登陆'
    }
    options = default.merge(options)
    if  current_user.nil? || (!options[:role].empty? && current_user.role != options[:role])
      redirect_to login_url, :alert => options[:alert]
      return false
    end
    true
  end

  # 当前登录用户
  def current_user
    session[:user]
  end
end
