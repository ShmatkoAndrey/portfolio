class CreateDropzoneFiles < ActiveRecord::Migration
  def change
    create_table :dropzone_files do |t|
      t.string :file
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
