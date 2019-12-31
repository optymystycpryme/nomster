class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :places
  has_many :photos
  has_many :comments

  validates :email, presence: true
  validates :username, presence: true, length: { maximum: 55, minimum: 2 }
end
