class Application < ApplicationRecord
  belongs_to :candidate_profile
  belongs_to :job_offer
end
