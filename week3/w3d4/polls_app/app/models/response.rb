# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :author_rigging

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_choice_id,
  class_name: :AnswerChoice

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_one :question,
  through: :answer_choice,
  source: :question

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?(respondent_id)
    sibling_responses.exists?(respondent: respondent_id)
  end

  def not_duplicate_response
    if respondent_already_answered?(self.user_id)
      errors[:user_id] << "already answered"
    end
  end

  def author_rigging
    respondant = question.poll.author
    errors[:user_id] << "can't answer own poll" if respondant.id == self.user_id
  end
end
