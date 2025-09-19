class CreateCandidateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :candidate_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :current_position
      t.integer :years_of_experience
      t.jsonb :skills
      t.string :location
      t.string :linkedin_url
      t.boolean :looking_for_job

      t.timestamps
    end
  end
end
