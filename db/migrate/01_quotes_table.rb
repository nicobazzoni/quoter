class QuotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :source
      t.string :philosophy
      t.string :quote
      t.string :_id
    end
  end
end

