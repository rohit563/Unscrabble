class AddGameNameToGame < ActiveRecord::Migration
  def change
    add_column :games, :gameName, :string
  end
end
