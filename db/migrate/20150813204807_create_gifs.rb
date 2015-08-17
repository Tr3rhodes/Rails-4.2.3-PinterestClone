class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.integer :user_id
      t.string :description
      t.string :picture

      t.timestamps null: false
    end
  end
end
