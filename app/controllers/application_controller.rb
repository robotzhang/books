class ApplicationController < ActionController::Base
  protect_from_forgery
  # 首页
  def homepage
    render :template => 'homepage'
  end
end
