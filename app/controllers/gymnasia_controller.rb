class GymnasiaController < ApplicationController
  def index
    @gymnasium = Gymnasium.all
  end

  def show
    @gymnasia = Gymnasium.find(params[:id])
  end

  def new
    @gymnasia = Gymnasium.new
  end

  def create
    @gymnasia = Gymnasium.create(gymnasia_params)

    if @gymnasia.save
      redirect_to gymnasia_path
    else
      render :new
    end
  end

  def edit
    @gymnasia = Gymnasium.find(params[:id])
  end

  def update
    @gymnasia = Gymnasium.find(params[:id])

    if @gymnasia.update(gymnasia_params)
      redirect_to gymnasia_path, notice: "修改資訊成功"
    else
      render :edit
    end
  end

  def destroy
    @gymnasia = Gymnasium.find(params[:id])
    @gymnasia.destroy
    redirect_to gymnasia_path, alert: "資訊已刪除"
  end

  private

  def gymnasia_params
    params.require(:gymnasium).permit(:name, :phone, :address, :introduction)
  end
end
