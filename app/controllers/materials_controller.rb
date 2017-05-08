class MaterialsController < ApplicationController
  def new
    if user_signed_in?
  	 @material = Material.new
    else
      redirect_to new_user_session_path
    end
  end

  def mymaterials
    if user_signed_in?
      @my_materials = Material.where(:user_id => current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def boughtmaterials
    if user_signed_in?
      @bought_ids = Bought.select("material_id").where(:user_id => current_user.id)
      @bought_materials = Material.where(:id => @bought_ids)
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

  def edit
    if user_signed_in?
      @material = Material.find(params[:id])
      if @material.user_id != current_user.id
        redirect_to materials_path
      end

      if request.put?
        @material.title = params[:material][:title]
        @material.description = params[:material][:description]
        @material.price = params[:material][:price]
        unless params[:material][:data].blank?
          @material.data = params[:material][:data]
        end

        if @material.save
          flash[:success] = "Material has been updated!"
          redirect_to edit_material_path(@material.id)
        end
      end
    else
      redirect_to new_user_session_path
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
          if request.post? and params.include?(:buy_material)
            if @material.price < current_user.budget
              bought = Bought.new
              bought.user_id = current_user.id
              bought.material_id = @material.id
              current_user.budget = current_user.budget - @material.price
              @material_user.budget = @material_user.budget + @material.price

              @material_user.save
              bought.save
              current_user.save
              @status = 1
              flash[:success] = "Material has been bought!"
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
          @status = 2
          unless UserReputation.where(:user_give => current_user.id, :user_recieve => @material_user.id).exists?
            if request.post? and params.include?(:reputation)
              user_reputation = UserReputation.new
              user_reputation.user_give = current_user.id
              user_reputation.user_recieve = @material_user.id

              @material_user.reputation = @material_user.reputation + 10

              @material_user.save
              user_reputation.save
              flash[:success] = "Reputation has been given to " + @material_user.name + "!"
              redirect_to material_path(@material)
            end
          else
            @status = 1
          end
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
  		flash[:success] = "Material is created!"
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
