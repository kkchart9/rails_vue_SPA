class Blog < ApplicationRecord
  validate :title
  validate :body
  validate :user_id
end
