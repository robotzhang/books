class Schedule < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :book
  belongs_to :chapter
  before_create do
    self.start = Time.now
    self.end = self.start
    !is_exist
  end

  def is_exist
    schedule = Schedule.where(:user_id => self.user_id, :book_id => self.book_id, :chapter_id => self.chapter_id).first
    schedule ? true : false
  end
end
