class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :forms
  end
end
