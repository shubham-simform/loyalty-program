class RegistrationsController < Devise::RegistrationsController
  
  private
  # Permiting params used in signing up the page
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :date_of_birth,
                                 :country_id)
  end
  # Permiting params on updating user details
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :country_id,
                                 :date_of_birth)
  end
end