class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :questions
  has_many :answers
  has_many :favorites, dependent: :destroy

  validates :screen_name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 2..24 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :password, confirmation: true, length: { in: 2..26 }
  validates :password_confirmation, presence: true, if: :password

  # validates :status
  validates :child_age1, length: { maximum: 2 }
  validates :child_age2, length: { maximum: 2 }

  validates :residence_country, presence: true, length: { in: 1..25 }
  validates :residencenow, presence: true,length: { in: 1..24 }

  validates :school, length: { maximum: 70}
  validates :origin, length: { maximum: 25 }

  validates :wannaknow, length: { maximum: 2000 }
  validates :know, length: { maximum: 2000}

  validates :bio, length: { maximum: 2000 }
  validates :comment, length: { maximum: 2000 }


end