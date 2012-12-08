class BooksController < ApplicationController
  def index

  end
  def show
    @book = Book.find_by_seo_url(params[:seo_url], :include => 'chapters')
    @schedules = Schedule.where(:user_id => current_user.id, :book_id => @book.id).all if current_user
  end

  # 想读
  def like

  end
end
