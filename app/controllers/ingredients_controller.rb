class IngredientsController < ApplicationController
before_action :set_dose, only: [:new, :create]

  def new
    @ingredient = Ingredient.new
  end


  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.dose = @dose
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  private

  def set_dose
    @dose = Dose.find(params[:dose_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:content)
  end
end
