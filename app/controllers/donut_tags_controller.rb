class DonutTagsController < ApplicationController
  before_action :set_donut, only: [:new, :create]
  before_action :set_donut_tag, only: [:destroy]

  def new
    @donut_tag = DonutTag.new()
  end

  def create
    @donut_tag = DonutTag.new(donut_tag_params)
    @donut_tag.donut = @donut

    if @donut_tag.save
      redirect_to bakery_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @donut_tag.destroy
    redirect_to bakery_path
  end

  private

  def set_donut
    @donut = Donut.find(params[:donut_id])
  end

  def set_donut_tag
    @donut_tag = DonutTag.find(params[:id])
  end

  def donut_tag_params
    params.require(:donut_tag).permit(:tag_id, :donut_id)
  end
end
