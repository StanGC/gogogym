class GymnasiaController < ApplicationController
  def index
    @gymnasia = Gymnasium.all
  end
end
