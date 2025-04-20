class Section < ApplicationRecord
  has_many :contents, dependent: :destroy
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :order, presence: true, numericality: { only_integer: true }

  before_validation :generate_slug, if: -> { title.present? && slug.blank? }

  private

  def generate_slug
    self.slug = title.parameterize
  end
end 