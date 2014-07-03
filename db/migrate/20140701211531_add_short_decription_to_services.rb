class AddShortDecriptionToServices < ActiveRecord::Migration
  def change
    add_column :services, :short_description, :text
    add_column :services, :icon, :string
  end
end
