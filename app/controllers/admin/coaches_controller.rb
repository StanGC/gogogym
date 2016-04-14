class Admin::CoachesController < ApplicationController
  
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @coaches = Coach.all
  end

  def edit
    @gym = Gym.find_by(params[:gym_id])
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

  private

  def coach_params
    params.require(:coach).permit(:name, :major, :introduction, :gym_id, photo_attributes: [:image, :id])
  end
end