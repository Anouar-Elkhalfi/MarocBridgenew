class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def index
    # Action vide pour éviter l'erreur de callback
  end
end
