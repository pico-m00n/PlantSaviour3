class AnswerComment < ApplicationRecord
  belongs_to :answer
  belongs_to :end_user
end
