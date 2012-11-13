class User < ActiveRecord::Base
  attr_accessible :nickname, :email, :password,:password_confirmation
  before_create :encryption
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  private
  def encryption
    self.password = Digest::SHA512.hexdigest(self.password)
  end
end
