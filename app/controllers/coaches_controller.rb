class CoachesController < ApplicationController
  before_action :find_gyms, except: [:index, :destroy]

  def index
    @gym = Gym.find(params[:gym_id])
    @coaches = @gym.coaches
  end

  def show
    @gym = Gym.find(params[:gym_id])
    @coach = @gym.coaches
  end

  def new
    @gym = Gym.find(params[:gym_id])
    @coach = @gym.coaches.new
    @photo = @coach.build_photo
  end

  def create
    @gym = Gym.find(params[:gym_id])
    @coach = @gym.coaches.new(coach_params)

    if @coach.save
      redirect_to gym_coaches_path
    else
      render :new
    end
  end

  def edit
    @coach = Coach.find(params[:id])

    if @coach.photo.present?
      @coach = @coaches.photo
    else
      @coach = @coaches.build_photo
    end
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
    params.require(:coach).permit(:name, :major, :introduction, :gym_id, photo_attributes: [:image, :id])
  end
end
