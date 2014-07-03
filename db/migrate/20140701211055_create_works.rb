class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :service_id
      t.integer :project_id

      t.timestamps
    end
    add_index :works, :service_id
    add_index :works, :project_id
  end
end
