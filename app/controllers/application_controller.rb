class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :phone_number, :location, :linkedin_url])
  end

  private

  def verify_policy_scoped_needed?
    return false if skip_pundit?
    self.class.action_methods.include?('index') && action_name == 'index'
  end

  def skip_pundit?
    devise_controller? ||
      params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
