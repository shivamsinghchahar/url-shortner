class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.string :shortend_url, null: false
      t.index :original_url, unique: true
      t.index :shortend_url, unique: true

      t.timestamps
    end
  end
end
