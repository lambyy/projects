# == Schema Information
#
# Table name: taggings
#
#  id           :integer          not null, primary key
#  tag_topic_id :integer          not null
#  short_url_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Tagging < ApplicationRecord
  validates :tag_topic_id, :short_url_id, presence: true

  belongs_to :tagged_url,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl

  belongs_to :tag_topic,
    primary_key: :id,
    foreign_key: :tag_topic_id,
    class_name: :TagTopic


end
