class JobOffer < ApplicationRecord
  belongs_to :published_by, polymorphic: true

  validates :title, :description, :location, :contract_type, :salary_range, :published_by, presence: true
end
