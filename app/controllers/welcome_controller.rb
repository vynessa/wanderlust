class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/trips'
    end
  end
end
