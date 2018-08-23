# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

   #GET /users/sign_in
   def new
     super
   end

   #POST /users/sign_in
   def create
     super
        #$profile_imgs = ['/underdog1.png','/underdog2.jpg','/underdog3.jpg','/underdog4.jpg','/underdog5.jpg','/underdog6.jpg','/underdog7.jpg','/underdog8.jpg','/underdog9.jpg','/underdog10.jpg','/underdog11.jpg']
        #$profile_img = profile_imgs.sample
   end

  #DELETE /users/sign_out
   def destroy
     super
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [])
  end
end
