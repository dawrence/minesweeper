# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    user
    size { 4 }
    number_of_mines { 3 }
    ended { false }
    started { false }
    board { Array.new(4).map { Array.new(4) } }
  end
end
