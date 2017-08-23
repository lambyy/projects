require 'date'

class Cat < ApplicationRecord
  CAT_COLORS = %w(brown white black orange).freeze

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: %w(M F)

  has_many :cat_rental_requests, dependent: :destroy

  def age
    time_ago_in_words(self.birth_date)
  end

end
