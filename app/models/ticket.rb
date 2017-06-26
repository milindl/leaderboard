class Ticket < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :approved, :deleted]
  before_create :set_status
  validate :user_credentials, :on => :create
  validates :link,
            presence: true,
            :format => URI::regexp(%w(http https)),
            uniqueness: { scope: [:user, :status] }

  validates :desc,
            length: { maximum: 200 }

  validates :typeof,
            presence: true,
            :format => { with: /\A[A-Za-z ]+\z/ }

  validates :points,
            presence: true

  scope :all_this_month, -> { where("DATE(created_at) BETWEEN ? AND ?", Time.now - 1.month, Time.now) }

  def set_status
    self.status = :pending
  end

  def user_credentials
    if self.user.nil? or self.user.is_valid_login? != true
      errors.add(:user, "Incorrect username/password")
    end
  end
end
