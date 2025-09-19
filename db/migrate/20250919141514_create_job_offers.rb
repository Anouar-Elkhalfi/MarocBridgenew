class CreateJobOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.string :location
      t.string :contract_type
      t.string :salary_range
      t.references :published_by, polymorphic: true, null: false

      t.timestamps
    end
  end
end
