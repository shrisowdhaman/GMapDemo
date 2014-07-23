class AddEventReferencesToEventsPhotos < ActiveRecord::Migration
  def change
    add_column :event_photos, :event_id, :integer
  end
end
