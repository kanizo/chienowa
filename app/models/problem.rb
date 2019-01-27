class Problem < ApplicationRecord
  belongs_to :editor
  
  validates :question, presence: true
  validates :answer, presence: true
end
