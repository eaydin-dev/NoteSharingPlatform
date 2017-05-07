class MaterialsController < ApplicationController
  def new
    if user_signed_in?
  	 @material = Material.new
    else
      redirect_to new_user_session_path
    end
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
      @material_user = User.find(@material.user_id)

      if @material.user_id == current_user.id
        @status = 1
      else
        unless Bought.where(:user_id => current_user.id, :material_id => @material.id).exists?
          if request.post?
            if @material.price < current_user.budget
              bought = Bought.new
              bought.user_id = current_user.id
              bought.material_id = @material.id
              current_user.budget = current_user.budget - @material.price

              bought.save
              current_user.save
              @status = 1
              flash[:success] = "Material has been bough!"
              redirect_to material_path(@material)
            else
              @status = 0
              flash[:error] = "Not enough budget :("
              redirect_to edit_user_registration_path
            end
          else
            @status = 0
          end
        else
          @status = 1
        end
      end
        
    else
      redirect_to new_user_session_path
    end
  end

  def create
  	@material = Material.new(permit_material)
    @material.user_id = current_user.id
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
  		params.require(:material).permit(:data, :title, :price, :description, :user_id)
  	end
end
