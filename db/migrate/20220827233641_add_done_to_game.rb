class AddDoneToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :done, :boolean
  end
end
