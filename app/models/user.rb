class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :username, uniqueness: true
  has_many :revisions

  def banned?
    Blacklist.exists?(ip: self.current_sign_in_ip)
  end
end
