class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :first_name, limit: 25, null: false
      t.string :last_name, limit: 50, null: false
      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :forms
  end
end
