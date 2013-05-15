class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :short
      t.text :long
      t.integer :counter, :default => 0

      t.timestamps
    end
  end
end
