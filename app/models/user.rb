class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true

  has_many :games, inverse_of: :user, dependent: :restrict_with_exception
end

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           default(""), not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
