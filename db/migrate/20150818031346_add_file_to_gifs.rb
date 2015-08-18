class AddFileToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :file_id, :string
  end
end
