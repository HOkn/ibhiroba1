class Event < ActiveRecord::Base
  validates :session, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 40 }
  validates :school, presence: true, length: { maximum: 40 }
  validates :comment, presence: true, length: { maximum: 2000 }
end
