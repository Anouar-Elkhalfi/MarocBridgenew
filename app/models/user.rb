class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  has_one :candidate_profile, dependent: :destroy
  has_one :recruiter_profile, dependent: :destroy
  has_one :headhunter_profile, dependent: :destroy

  enum role: { candidate: 0, recruiter: 1, headhunter: 2, admin: 3 }

  def admin?
    role == "admin"
  end

  def recruiter?
    role == "recruiter"
  end

  def headhunter?
    role == "headhunter"
  end

  def candidate?
    role == "candidate"
  end
end
