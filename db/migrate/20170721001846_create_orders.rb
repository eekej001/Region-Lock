class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50, null: false
      t.string :email, limit: 50, null: false
      t.string :title, limit: 90, null: false
      t.timestamps null: false
    end
  end


  def self.down
  	drop_table :orders
  end
end
