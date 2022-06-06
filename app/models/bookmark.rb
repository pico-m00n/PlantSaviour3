class Bookmark < ApplicationRecord
  belongs_to :end_user
  belongs_to :question
  validates :end_user_id, uniqueness: { scope: :question_id }
end
