class Habit < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true
  validates :category, presence: true
  belongs_to :user
end
