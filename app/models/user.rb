# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  fname           :string           not null
#  lname           :string           not null
#  img_url         :string
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, :session_token, :fname, :lname, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_token

  has_many :spots,
    class_name: :Spot,
    foreign_key: :host_id

  has_many :bookings,
    class_name: :Booking,
    foreign_key: :guest_id
  
  has_many :reviewed_spots,
    class_name: :Review,
    foreign_key: :guest_id

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    @user && @user.is_password?(password) ? @user : nil
  end

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_token
    self.session_token = User.generate_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    bpass = BCrypt::Password.new(self.password_digest)
    bpass.is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  def ensure_token
    self.session_token ||= User.generate_token
  end

end
