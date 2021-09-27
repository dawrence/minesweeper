class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id, null: false
      t.integer :size, null: false, default: 4
      t.integer :number_of_mines, null: false, default: 1
      t.boolean :started, default: false
      t.boolean :ended, default: false
      t.json :board, default: '[]'

      t.timestamps
    end
  end
end
