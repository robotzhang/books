class BooksController < ApplicationController
  def index

  end
  def show
    @book = Book.find(params[:id], :include => 'chapters')
  end
end
