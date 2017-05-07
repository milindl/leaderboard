class Ticket < ApplicationRecord
  belongs_to :user
  before_create :set_status
  validate :user_credentials, :on => :create
  validates :link,
            presence: true,
            :format => URI::regexp(%w(http https))

  validates :desc,
            length: { maximum: 200 }

  validates :typeof,
            presence: true,
            :format => { with: /\A[A-Za-z ]+\z/ }

  validates :points,
            presence: true

  def set_status
    self.status = false
  end

  def user_credentials
    if self.user.nil? or self.user.is_valid_login? != true
      return errors.add(:user, "Incorrect username/password")
    end
  end
end
