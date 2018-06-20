class User < ActiveRecord::Base
  has_secure_password

  before_save :downcase 

  validates :fiest_name, :last_name, :email, presence: true

  private
  def downcase
    self.fiest_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end
