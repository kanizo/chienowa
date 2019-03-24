class Editor < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  validates :title, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :problems, allow_destroy: true
  
  def like?(user)
    like_users.include?(user)
  end
end
