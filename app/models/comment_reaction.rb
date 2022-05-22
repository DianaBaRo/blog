# frozen_string_literal: true

class CommentReaction < ApplicationRecord
  belongs_to :comment
  belongs_to :reaction

  validates :reaction_count, presence: true, numericality: { only_integer: true, message: "should be added and should be a number" }
  validates :reaction_id, uniqueness: { scope: :comment_id, message: "should be unique per comment"}
end
