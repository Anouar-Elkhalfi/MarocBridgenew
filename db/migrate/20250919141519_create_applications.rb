class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.references :candidate_profile, null: false, foreign_key: true
      t.references :job_offer, null: false, foreign_key: true
      t.integer :status
      t.text :motivation_letter

      t.timestamps
    end
  end
end
