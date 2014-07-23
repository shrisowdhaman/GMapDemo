class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
      t.string :title
      t.string :desc
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer:photo_file_size
      t.timestamps
    end
  end
end
