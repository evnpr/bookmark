class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :link
      t.string :desc
      t.integer :profile_id

      t.timestamps
    end
  end
end
