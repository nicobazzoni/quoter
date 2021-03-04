class Comments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer  :user_id
      t.integer :quote_id
      t.timestamps
      t.string :content
    end
  end
end