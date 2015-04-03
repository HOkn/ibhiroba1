class Question < ActiveRecord::Base
  belongs_to :users
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :question_categories
  has_many :categories, through: :question_categories
  accepts_nested_attributes_for :categories


  validates :title, presence: true, length: { maximum: 40 }, uniqueness: { case_sensitive: false }
  validates :content, presence: true, length: { maximum: 2000 }
  # validates :askeduser, length: { maximum: 20 }
  # validates :keyword1, length: { maximum: 30 }
  # validates :keyword2, length: { maximum: 30 }
  # validates :keyword3, length: { maximum: 30 }

  def favorited_by?(user, question)
    Favorite.where(user_id: user.id).where(question_id: question.id).exists?
  end
end
