class CreateAgencies < ActiveRecord::Migration[7.1]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :website
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
