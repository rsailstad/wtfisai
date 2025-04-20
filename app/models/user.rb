class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :subscription
  has_many :content_progresses
  has_many :completed_contents, through: :content_progresses, source: :content

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def has_active_subscription?
    subscription&.active?
  end
end 