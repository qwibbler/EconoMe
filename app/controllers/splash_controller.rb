class SplashController < ApplicationController
  def home
    redirect_to groups_path if current_user
  end
end
