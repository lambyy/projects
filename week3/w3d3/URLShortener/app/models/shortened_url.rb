# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string
#  long_url   :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  validate :no_spamming
  validate :nonpremium_max

  private
  def no_spamming
    recent_entry_count = ShortenedUrl.where({
        created_at: (Time.now - 1.minute)..Time.now,
        user_id: self.user_id
      }).count
    if recent_entry_count > 5
      errors[:user_id] << "is spamming"
    end
  end

  def nonpremium_max
    entry_count = ShortenedUrl.where({user_id: self.user_id}).count
    if entry_count >= 5
      errors[:user_id] << "is not a premium user"
    end
  end

  public
  def self.prune(n)
    ShortenedUrl.joins(:submitter).where("shortened_urls.created_at < \'#{n.minutes.ago}\'
      AND users.premium = \'f\'").destroy_all
  end

  def self.create_short_url(user, long_url)
    ShortenedUrl.create!(user_id: user.id,
                          long_url: long_url,
                          short_url: ShortenedUrl.random_code)
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64[0..15]
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64[0..15]
    end
    code
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where({ created_at: (Time.now - 10.minutes)..Time.now }).count
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Tagging

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

end
