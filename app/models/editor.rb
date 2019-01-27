class Editor < ApplicationRecord
  belongs_to :user, optional: true
  has_many :problems
  
  validates :description, presence: true
  accepts_nested_attributes_for :problems, allow_destroy: true
end
