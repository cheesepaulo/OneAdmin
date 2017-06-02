class CreatePrinters < ActiveRecord::Migration[5.0]
  def change
    create_table :printers do |t|
      t.string :name
      t.integer :kind
      t.string :ip_address
      t.boolean :leased, default: false
      t.integer :status
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
