class Micropost < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 151}
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end
