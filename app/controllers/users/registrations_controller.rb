# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
     super
  end

  # POST /resource
 def create
     super
     @user = User.find(current_user.id)
     @user.wallet_address = Blockchain.instance.make_wallet.to_s
     @user.save
             #$profile_imgs = ['/underdog1.png','/underdog2.jpg','/underdog3.jpg','/underdog4.jpg','/underdog5.jpg','/underdog6.jpg','/underdog7.jpg','/underdog8.jpg','/underdog9.jpg','/underdog10.jpg','/underdog11.jpg']
             #$profile_img = profile_imgs.sample
   end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :budget, :img])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :budget, :img])
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end
end
