class DonutsController < ApplicationController
  def index
   @donuts = Donut.all
   @users = User.where(baker: true)
   @markers = @users.geocoded.map do |user|
    {
      lat: user.latitude,
      lng: user.longitude
    }
  end
  end

  def show
    @donut = Donut.find(params[:id])
    @user = @donut.user
  end

  def new
    @donut = Donut.new
  end

  def create

    @donut = Donut.new(donut_params)
    @donut.user_id = current_user.id

    if @donut.save
      redirect_to donut_path(@donut)
    else

      render :new, status: :unprocessable_entity
    end
  end

  private

    def donut_params
      params.require(:donut).permit(:name, :photo, :description, :price, :available)
    end
end
