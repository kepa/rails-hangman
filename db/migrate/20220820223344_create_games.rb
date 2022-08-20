class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :lives
      t.string :word
      t.string :current_try
      t.string :wrong_letters

      t.timestamps
    end
  end
end
