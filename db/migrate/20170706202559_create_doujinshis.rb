class CreateDoujinshis < ActiveRecord::Migration
  def self.up
    create_table :doujinshis do |t|
      t.string :title, limit: 50, null: false
      t.timestamps null: false
    end
  end


  def self.down
  	drop_table :doujinshis
  end

end
