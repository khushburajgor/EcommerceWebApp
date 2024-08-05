class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.json :images
      t.references :category, null: false, foreign_key: true
      t.text :variants

      t.timestamps
    end
  end
end
