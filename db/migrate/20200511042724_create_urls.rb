class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.string :shortened_url, null: false
      t.index :original_url, unique: true
      t.index :shortened_url, unique: true

      t.timestamps
    end
  end
end
