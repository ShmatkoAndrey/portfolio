class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :dropzone_file_id
      t.integer :like

      t.timestamps null: false
    end
  end
end
