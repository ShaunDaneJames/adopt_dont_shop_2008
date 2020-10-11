class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    shelter = Shelter.new({
      # id: params[:shelter][:id],
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
      })
      shelter.save
      redirect_to '/shelters'
  end

  def show
    @shelter = Shelter.find(params[:id])
  end
end
