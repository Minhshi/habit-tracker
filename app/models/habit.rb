class Habit < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true
  validates :category, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :user
end
