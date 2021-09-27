class GameSerializer < ActiveModel::Serializer
  attributes :id, :number_of_mines, :size, :board, :ended, :started
end
