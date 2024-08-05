class ChangeVariantsInProducts < ActiveRecord::Migration[7.0]
  def up
    # Change the column type from `text` to `jsonb` with an explicit cast
    execute <<-SQL
      ALTER TABLE products
      ALTER COLUMN variants TYPE jsonb
      USING variants::jsonb;
    SQL
  end

  def down
    # Revert the column type back to `text` if rolling back
    change_column :products, :variants, :text
  end
end
