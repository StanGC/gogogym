class GymsController < ApplicationController
  def index
    @gym = Gym.all
  end

  def show
    @gyms = Gym.find(params[:id])
  end

  def new
    @gyms = Gym.new
    @photo = @gyms.build_photo
  end

  def create
    @gyms = Gym.create(gyms_params)

    if @gyms.save
      redirect_to gyms_path
    else
      render :new
    end
  end

  def edit
    @gyms = Gym.find(params[:id])

    if @gyms.photo.present?
      @photo = @gyms.photo
    else
      @photo = @gyms.build_photo
    end
  end

  def update
    @gyms = Gym.find(params[:id])

    if @gyms.update(gyms_params)
      redirect_to gyms_path, notice: "修改資訊成功"
    else
      render :edit
    end
  end

  def destroy
    @gyms = Gym.find(params[:id])
    @gyms.destroy
    redirect_to gyms_path, alert: "資訊已刪除"
  end

  private

  def gyms_params
    params.require(:gym).permit(:name, :phone, :address, :introduction, photo_attributes: [:image, :id])
  end
end
