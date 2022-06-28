class SplashController < ApplicationController
  def home
    redirect_to categories_path if current_user
  end
end
