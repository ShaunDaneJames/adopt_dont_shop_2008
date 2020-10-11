class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    pet = Pet.new({
      image: params[:image],
      name: params[:name],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      shelter_id: params[:shelter_id],
      })
      pet.save
      redirect_to '/pet'
  end
end
