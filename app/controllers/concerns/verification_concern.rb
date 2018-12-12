module VerificationConcern
    extend ActiveSupport::Concern

    included do
        helper_method :confirm_authenticated
        helper_method :confirm_admin
    end

    def confirm_authenticated
        redirect_to '/401' unless user_signed_in?
    end
  
    def confirm_admin
        redirect_to '/403' unless current_user and current_user.admin?
    end
end