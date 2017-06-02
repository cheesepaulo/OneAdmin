class AddKindToCartridge < ActiveRecord::Migration[5.0]
  def change
    add_column :cartridges, :kind, :integer
  end
end
