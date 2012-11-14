#coding=utf-8
class Chapter < ActiveRecord::Base
  validates :number, :uniqueness => {
      :scope => :book_id, # 联合唯一验证
      :message => "章节%{value}已添加"
  }, :on => 'create'
  validates_presence_of :title, :message => '标题不能为空'
  validates_presence_of :content, :message => '章节内容不能为空'
  validates_numericality_of :number, :message => '章节号只能为整数'
  belongs_to :book
end
