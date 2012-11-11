class ApplicationController < ActionController::Base
  protect_from_forgery
  # 首页
  def homepage
    @books = Book.all(:limit=>10)
    render :template => 'homepage'
  end
end
