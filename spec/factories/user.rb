# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email, 'user@user0001')
    password_digest { ::BCrypt::Password.create('password') }
  end
end
