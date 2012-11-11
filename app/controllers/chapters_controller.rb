class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.find(params[:id], :include => 'book')
  end
end
