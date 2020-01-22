class AddLatitudeAndLongitudeToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :latitude, :float
    add_column :contacts, :longitude, :float
  end
end
