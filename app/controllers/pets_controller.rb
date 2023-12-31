class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pets = Pet.all
    @pets = Pet.search_pets(params[:query]) if params[:query].present?
  end

  def show
    @adoption = Adoption.new
    @adoptions_users = Adoption.where(pet: @pet)
    @adoptions_count = Adoption.where(pet: @pet, owner: current_user).count
    @adoptions_approved = Adoption.where(pet: @pet, status: true).count
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit; end

  # POST /pets
  def create
    @pet = Pet.new(pet_params)
    @pet.seller = current_user

    if @pet.save
      redirect_to @pet, notice: "pet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: "Pet was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
    redirect_to pets_url, notice: "Pet was successfully destroyed.", status: :see_other
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pet
    @pet = Pet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pet_params
    params.require(:pet).permit(:name, :birthday, :description, :category, :breed, :photo)
  end
end
