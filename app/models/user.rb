class User < ActiveRecord::Base
  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true


  def self.authenticate(email, password)
    #return nil if user = 
    return nil if (User.where(email: email).last) == nil
  	user = User.where(email: email).last
  	user.password == password ? user : nil
  end
end