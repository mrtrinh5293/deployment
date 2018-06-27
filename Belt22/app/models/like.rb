class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  def user
  	User.find(self.user_id)
  end

end