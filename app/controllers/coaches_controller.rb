class CoachesController < ApplicationController
  before_action :find_gyms, except: [:index, :destroy]

  def index
    @coaches = Coach.all
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(coach_params)

    if @coach.save
      redirect_to gym_coaches_path(@coach)
    else
      render :new
    end
  end

  def edit
    @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])

    if @coach.update(coach_params)
      redirect_to gym_coaches_path
    else
      render :edit
    end
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy
    redirect_to gym_coaches_path(@coach), alert: "資訊已刪除"
  end

  private

  def find_gyms
    @gyms = Gym.find(params[:gym_id])
  end

  def coach_params
    params.require(:coach).permit(:name, :major, :introduction, :gym_id)
  end
end
