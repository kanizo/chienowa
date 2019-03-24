class Like < ApplicationRecord
  belongs_to :user
  belongs_to :editor
  counter_culture :editor
end
