class ApplicationController < ActionController::Base
  include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protect_from_forgery with: :exception

    before_filter :set_locale

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
      { :locale => I18n.locale }
    end

    def user_not_authorized
      flash[:error] = "You are not authorized to perform this action."
    end
end
