class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :desc
      t.integer :profile_id

      t.timestamps
    end
  end
end
