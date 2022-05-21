# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :comment_reactions
  has_many :reactions, through: :comment_reactions

  validates :content, presence: true
end
