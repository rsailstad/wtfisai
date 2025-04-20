class Subscription < ApplicationRecord
  belongs_to :user

  validates :status, presence: true, inclusion: { in: %w[active cancelled expired] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  def active?
    status == 'active' && end_date > Time.current
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end 