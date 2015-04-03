class Category < ActiveRecord::Base
  has_many :question_categories
  has_many :questions, through: :question_categories

  validates :name, length: { maximum: 40 }
end
