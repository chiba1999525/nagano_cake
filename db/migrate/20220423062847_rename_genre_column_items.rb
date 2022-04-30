class RenameGenreColumnItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :genre, :genre_id
  end
end
