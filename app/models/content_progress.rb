class ContentProgress < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :user_id, uniqueness: { scope: :content_id }
  validates :status, presence: true, inclusion: { in: %w[started completed] }
end 