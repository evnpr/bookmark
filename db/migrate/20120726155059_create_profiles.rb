class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
