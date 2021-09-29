class Game < ApplicationRecord
  belongs_to :user, inverse_of: :games, dependent: :delete

  before_create :create_board

  validates :board, presence: true
  validates :size, presence: true
  validates :number_of_mines, presence: true
  validates :user_id, presence: true

  def create_board
    new_board = Array.new(size).map { Array.new(size) }
    number_of_mines.times do
      new_board[rand(size-1)][rand(size-1)] = 'X'
    end
    self.board = new_board
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
