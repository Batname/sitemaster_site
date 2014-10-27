class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :title
      t.text :short_description
      t.text :text
      t.string :permalink
      t.integer :position
      t.boolean :visible

      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at

      t.string :other_attachment_file_name
      t.string :other_attachment_content_type
      t.integer :other_attachment_file_size
      t.datetime :other_attachment_updated_at

      t.timestamps
    end
    Page.create_translation_table! title: :string, text: :text, short_description: :text
  end

  def down
    drop_table :pages
    Page.drop_translation_table!
  end

end
