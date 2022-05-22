# frozen_string_literal: true

module ApplicationHelper
  def not_empty(collection)
    collection.size >= 1
  end
end
