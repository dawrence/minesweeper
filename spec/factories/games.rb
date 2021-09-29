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

# == Schema Information
#
# Table name: games
#
#  id              :bigint           not null, primary key
#  board           :json
#  ended           :boolean          default(FALSE)
#  number_of_mines :integer          default(1), not null
#  size            :integer          default(4), not null
#  started         :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer          not null
#
