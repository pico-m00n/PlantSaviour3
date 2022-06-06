class Tag < ApplicationRecord
  has_many :question_tags, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :questions, through: :question_tags
  has_many :posts, through: :post_tags
end
