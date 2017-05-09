class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :materials , dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :boughts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
