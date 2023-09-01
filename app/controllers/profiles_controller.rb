class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[display]
  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def display
  end
end
