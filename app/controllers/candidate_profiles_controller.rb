class CandidateProfilesController < ApplicationController
  def new
    @candidate_profile = CandidateProfile.new
  end
  def index
    @candidate_profiles = CandidateProfile.all
  end

def create
  @candidate_profile = CandidateProfile.new(candidate_profile_params)
  @candidate_profile.user = current_user # <-- Ajoute cette ligne

  if @candidate_profile.skills.is_a?(String)
    begin
      parsed = JSON.parse(@candidate_profile.skills)
      @candidate_profile.skills = parsed if parsed.is_a?(Hash) || parsed.is_a?(Array)
    rescue JSON::ParserError
    end
  end

  if @candidate_profile.save
    redirect_to root_path, notice: "Profil candidat créé."
  else
    render :new, status: :unprocessable_content
  end
end

  def show
  @candidate_profile = CandidateProfile.find(params[:id])
end

def edit
  @candidate_profile = CandidateProfile.find(params[:id])
end

def update
  @candidate_profile = CandidateProfile.find(params[:id])
  if @candidate_profile.update(candidate_profile_params)
    redirect_to candidate_profile_path(@candidate_profile), notice: "Profil mis à jour."
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @candidate_profile = CandidateProfile.find(params[:id])
  @candidate_profile.destroy
  redirect_to candidate_profiles_path, notice: "Profil supprimé."
end

  private

  def candidate_profile_params
    params.require(:candidate_profile).permit(
    :current_position,
    :years_of_experience,
    :location,
    :linkedin_url,
    :looking_for_job,
    :skills
  )
  end
end
