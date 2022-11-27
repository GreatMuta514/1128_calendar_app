# frozen_string_literal: true

class Diary < ApplicationRecord
  belongs_to :user

  enum good_or_bad: { good: 0, bad: 1 }

  validates :good_or_bad, presence: true
  validates :review_the_day, length: { maximum: 400 }
  validates :for_me_tommorrow, length: { maximum: 400 }
  validates :user_id, presence: true
end
