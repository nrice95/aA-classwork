class Api::GuestsController < ApplicationController
  def index
    @guests = Guest.all
    render :index
  end

  def show
    @guest = Guest.find_by(id: params[:id])
    @gifts = Gift.find_by(guest_id: @guest.id)
    # debugger
    render :show
  end
end
