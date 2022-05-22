# frozen_string_literal: true

class Reaction < ApplicationRecord
  has_many :comments, through: :comment_reactions

  validates :emoji, presence: true
end
