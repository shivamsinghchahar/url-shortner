class AddClicksToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :clicks, :integer, default: 0, null: false
  end
end
