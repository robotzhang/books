#coding=utf-8
class Book < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_uniqueness_of :seo_url, :message => 'seo url必须唯一'
  has_many :chapters
end
