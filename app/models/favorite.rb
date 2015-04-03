class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :questions
  belongs_to :answers

  validates :user, presence: true
  validates :user_id, uniqueness: { scope: :question_id }
end
