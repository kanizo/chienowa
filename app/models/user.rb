class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  has_many :editors
  has_many :likes, dependent: :destroy
  has_many :like_editors, through: :likes, source: :editor
  
  include Gravtastic
    gravtastic
end
