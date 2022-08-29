class User < ApplicationRecord

  has_secure_password

  before_validation :cleanup_email

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: {minimum: 6}

  validates :password, confirmation: true

  private

  def cleanup_email
    self.email = email.downcase if email.present?
    self.email = email.strip if email.present?
  end
end
