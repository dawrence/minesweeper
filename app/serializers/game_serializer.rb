class GameSerializer < ActiveModel::Serializer
  attributes :id, :number_of_mines, :size, :board, :ended, :started
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
