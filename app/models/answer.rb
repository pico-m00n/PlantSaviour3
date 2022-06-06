class Answer < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user
  belongs_to :question
  has_many :answer_comment, dependent: :destroy
end
