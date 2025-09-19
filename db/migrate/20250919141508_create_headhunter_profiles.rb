class CreateHeadhunterProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :headhunter_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :agency, null: false, foreign_key: true
      t.string :position
      t.string :phone_number

      t.timestamps
    end
  end
end
