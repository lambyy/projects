class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :author, foreign_key: :user_id, class_name: :User
  belongs_to :post
  belongs_to :parent_comment, foreign_key: :parent_comment_id, optional: true
  has_many :child_comments, foreign_key: :parent_comment_id
end
