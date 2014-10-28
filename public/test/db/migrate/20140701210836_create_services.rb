class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :text
      t.string :image
      t.string :permalink
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
  end
end
