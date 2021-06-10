class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @restaurants = Restaurant.all
  end

  def dashboard
    #@owners = User.find_by(status_owner: "owner")
    @owner = current_user.status_owner == true
    # if the status of the user is owner he has an acces to the dashboard where he can create a restaurant edit or updtae
  end

  def thank_you
  end
end
