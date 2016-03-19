class User < ActiveRecord::Base

  has_secure_password
  # note: has_secure_password automatically adds validations
  # for presence of password, password length < 72 characters,
  # and password_confirmation

  validates :password, length: { minimum: 6 }, on: :create

  validates :email,
    presence: true,
    uniqueness: true,
    format: {
      with: /@/,
      message: "not a valid format"
    }

  has_many :questions
  has_many :answers
  has_many :ratings
end
