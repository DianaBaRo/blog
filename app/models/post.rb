# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true

  def self.by_user(user_id)
    where(user: user_id)
  end
end
