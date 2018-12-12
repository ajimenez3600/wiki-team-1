module ApplicationHelper
    def confirm_authenticated
        redirect_to '/401' unless user_signed_in?
      end
  
      def confirm_admin
        redirecct_to '/403' unless current_user and current_user.admin?
      end
end
