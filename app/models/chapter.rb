class Chapter < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :book
end
