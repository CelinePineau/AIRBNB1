class HomesController < ApplicationController

  def index
    # @homes = Home.all
    @homes = Home.with_attached_photo
  end

  def show
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    @home.user_id = current_user.id
    respond_to do |format|
      if @home.save!
        format.html { redirect_to home_path(@home) }
        format.json
      else
        format.html { render "homes/new", status: :unprocessable_entity }
        format.json
      end
    end
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])
    @home.update(home_params)
    redirect_to home_path(@home)
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to homes_path, status: :see_other
  end

  private

  def home_params
    params.require(:home).permit(:title, :address, :description, :price, :photo)
  end
end
