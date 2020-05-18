class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original, null: false
      t.string :slug, null: false
      t.index :original, unique: true
      t.index :slug, unique: true

      t.timestamps
    end
  end
end
