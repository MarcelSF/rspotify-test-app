class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :uuid
      t.string :name

      t.timestamps
    end
  end
end
