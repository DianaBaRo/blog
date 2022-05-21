# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :reactions

  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, confirmation: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
