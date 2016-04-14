class HomeController < ApplicationController

  def index
    @gyms = Gym.limit(3)
  end
end
