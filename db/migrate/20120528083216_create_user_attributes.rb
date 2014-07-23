class CreateUserAttributes < ActiveRecord::Migration
  def change
    create_table :user_attributes do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.references :user
      t.timestamps
    end
  end
end
