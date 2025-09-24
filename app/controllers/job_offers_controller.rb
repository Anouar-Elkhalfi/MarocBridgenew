class JobOffersController < ApplicationController
  def index
    @job_offers = policy_scope(JobOffer)
  end

  def show
    @job_offer = JobOffer.find(params[:id])
    authorize @job_offer
  end

  def new
    @job_offer = JobOffer.new
    authorize @job_offer
  end

  def edit
    @job_offer = JobOffer.find(params[:id])
    authorize @job_offer
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    authorize @job_offer
    publisher = HeadhunterProfile.first || RecruiterProfile.first
    if publisher.nil?
      @job_offer.errors.add(:published_by, "Aucun profil de publication trouvé")
      render :new, status: :unprocessable_entity
      return
    end
    @job_offer.published_by = publisher

    if @job_offer.save
      redirect_to job_offers_path, notice: "Offre créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @job_offer = JobOffer.find(params[:id])
    authorize @job_offer
    if @job_offer.update(job_offer_params)
      redirect_to job_offer_path(@job_offer), notice: "Offre mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job_offer = JobOffer.find(params[:id])
    authorize @job_offer
    @job_offer.destroy
    redirect_to job_offers_path, notice: "Offre supprimée avec succès."
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:title, :description, :requirements, :location, :contract_type, :salary_range)
  end
end
