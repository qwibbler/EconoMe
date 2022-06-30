class CreateEntityGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_groups do |t|
      t.references :entity, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
