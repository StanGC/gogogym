class CoachesController < ApplicationController
  before_action :authenticate_user!

  def index
    @coaches = Coach.all
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
    @gym = Gym.find(params[:gym_id])
    @coach = @gym.coaches.find(params[:id])

    if @coach.photo.present?
      @photo = @coach.photo
    else
      @photo = @coach.build_photo
    end
  end

  def update
    @gym = Gym.find(params[:gym_id])
    @coach = @gym.coaches.find(params[:id])

    if @coach.update(coach_params)
      redirect_to gym_coaches_path, notice: "資訊修改成功"
    else
      render :edit
    end
  end

  def destroy
    @gym = Gym.find(params[:gym_id])
    @coach = @gym.coaches.find(params[:id])
    @coach.destroy
    redirect_to gym_coaches_path, alert: "資訊已刪除"
  end

  def reservation
    @coach = Coach.find(params[:coach_id])
  end

  def jsonload
  end

  private

  def coach_params
    params.require(:coach).permit(:name, :major, :introduction, :gym_id, photo_attributes: [:image, :id])
  end
end
