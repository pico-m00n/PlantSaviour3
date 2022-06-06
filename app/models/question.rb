class Question < ApplicationRecord
  belongs_to :end_user
  has_many :answers, dependent: :destroy
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  has_many :bookmarks, dependent: :destroy
  
  has_one_attached :image
  def get_image
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def bookmarked_by?(end_user)
    bookmarks.where(end_user_id: end_user).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @question = Question.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @question = Question.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @question = Question.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @question = Question.where("title LIKE?","%#{word}%")
    else
      @question = Question.all
    end
  end
end
