#coding=utf-8
class UsersController < ApplicationController
  before_filter :authenticated, :only => 'show' # for test login
  def show

  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to request.env["HTTP_REFERER"] || root_url, :notice => '成功登录！'
    else
      render :new
    end
  end
  def destroy
    session[:user] = nil
    redirect_to request.env["HTTP_REFERER"] || root_url, :notice => "已成功退出系统！"
  end
  def login
    @user = User.new(params[:user])
    user = User.where(:email => @user.email, :password => @user.password).first
    if user
      session[:user] = user
      redirect_to request.env["HTTP_REFERER"] || root_url, :notice => "登陆成功！"
    else
      @user.errors[:account] = '用户名或密码错误！' unless @user.email.nil?
    end
  end

  def test

  end
end
