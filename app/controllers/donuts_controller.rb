class DonutsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_donut, only: [:edit, :update]

  def index
    if Donut.count == 0
      @donuts = false
    else
      @donuts = true
      @found = true
      if params[:query].present?
        @donuts_available = Donut.search_by_name_and_description(params[:query]).where(available: true)
        @donuts_not_available = Donut.search_by_name_and_description(params[:query]).where(available: false)
        if @donuts_available.empty? && @donuts_not_available.empty?
          @found = false
        end
      else
        @donuts_available = Donut.where(available: true)
        @donuts_not_available = Donut.where(available: false)
      end
    end
  end

  def show
    @donut = Donut.find(params[:id])
    @user = @donut.user

    @markers =
      [{
        lat: @user.latitude,
        lng: @user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {donut: @donut, user: @user}),
        marker_html: render_to_string(partial: "marker",locals: {donut: @donut})
      }]
  end

  def new
    @donut = Donut.new
  end

  def create
    @donut = Donut.new(donut_params)
    @donut.user_id = current_user.id

    if @donut.save
      redirect_to bakery_path # donut_path(@donut)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @donut.update(donut_params)
    redirect_to bakery_path
  end

  private

  def donut_params
    params.require(:donut).permit(:name, :photo, :description, :price, :available)
  end

  def set_donut
    @donut = Donut.find(params[:id])
  end

end
