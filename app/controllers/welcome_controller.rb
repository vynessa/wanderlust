class WelcomeController < ApplicationController
  def index
    redirect_to trips_path if user_signed_in?
  end
end
