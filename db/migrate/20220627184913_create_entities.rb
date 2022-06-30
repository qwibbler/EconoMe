class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.references :user, foreign_key: true, index: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
