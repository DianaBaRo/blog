class CommentReaction < ApplicationRecord
  belongs_to :comment
  belongs_to :reaction

  accepts_nested_attributes_for :reaction
end
