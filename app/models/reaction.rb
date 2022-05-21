class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  
  validates :emoji, presence: true
end
