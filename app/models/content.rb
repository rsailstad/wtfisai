class Content < ApplicationRecord
  belongs_to :section
  has_many :content_progresses
  has_many :users, through: :content_progresses
  has_rich_text :body

  validates :title, presence: true
  validates :order, presence: true, numericality: { only_integer: true }
  validates :slug, presence: true, uniqueness: true
  validates :content_type, presence: true, inclusion: { in: %w[article video quiz] }
  validate :video_url_presence_for_video_type

  before_validation :generate_slug, if: -> { title.present? && slug.blank? }

  scope :free, -> { where(premium: false) }
  scope :premium, -> { where(premium: true) }

  def previous_content
    section.contents.where("\"order\" < ?", order).order(order: :desc).first
  end

  def next_content
    section.contents.where("\"order\" > ?", order).order(:order).first
  end

  def video_embed_url
    return nil unless video_url.present? && content_type == 'video'
    
    if video_url.include?('youtube.com') || video_url.include?('youtu.be')
      YouTubeEmbed.new(video_url).embed_url
    else
      video_url
    end
  end

  private

  def generate_slug
    self.slug = title.parameterize
  end

  def video_url_presence_for_video_type
    if content_type == 'video' && video_url.blank?
      errors.add(:video_url, "can't be blank for video content")
    end
  end
end 