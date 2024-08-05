class DropProductTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :product
  end

  def down
    # Define the schema for the `product` table if you want to rollback this migration.
    create_table :product do |t|
      t.string :title
      t.text :description
      t.json :images, default: []
      t.json :variants, default: {}
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
