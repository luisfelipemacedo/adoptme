class AdoptionsController < ApplicationController
  before_action :set_adoption, only: :destroy
  before_action :set_pet, only: [:new, :create]

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new
    @adoption.status = false
    @adoption.pet = @pet
    @adoption.owner = current_user
    @adoption.save!
    redirect_to pet_path(@pet), notice: "Request Received"
  end

  def destroy
    @adoption.destroy
    redirect_to pet_path(@adoption.pet), status: :see_other
  end

  private

  def adoption_params
    params.require(:adoption).permit(:status, :adopter_id, :pet_id)
  end

  # def set_bookmark
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
