class MaterialsController < ApplicationController
  def new
  	@material = Material.new
    
  end

  def index
  	@materials = Material.all

    if params[:search]
      if user_signed_in?
        @materials = Material.search(params[:search])
      else
        redirect_to new_user_session_path
      end
    else
      @materials = Material.all
    end
  end

  def show
    if user_signed_in?
      @material = Material.find(params[:id])

    else
      redirect_to new_user_session_path
    end
  end

  def create
  	@material = Material.new(permit_material)
  	if @material.save
  		flash[:success] = "Success!"
  		redirect_to material_path(@material)
  	else
  		flash[:error] = @material.errors.full_messages
  		redirect_to new_material_path
  	end
  end

  private
  	def permit_material
  		params.require(:material).permit(:data, :title, :price, :source, :description)
  	end
end
