class DonutsController < ApplicationController
  def index
   @donuts = Donut.all
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
    if @donut.save
      #redirect_to donut_path(@donut)
    else
      render user_path(@donut.user), status: :unprocessable_entity
    end
  end

  private

    def donut_params
      params.require(:donut).permit(:name, :photo, :description, :price, :available)
    end
end
