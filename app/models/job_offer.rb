class JobOffer < ApplicationRecord
  belongs_to :published_by, polymorphic: true
end
