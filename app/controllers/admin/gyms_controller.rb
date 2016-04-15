class Admin::GymsController < ApplicationController

  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @gym = Gym.all
  end

end
