class AddPinnedToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :pinned, :integer, default: 0, null: false
  end
end
