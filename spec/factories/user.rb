# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { '123456789' }
  end
end
