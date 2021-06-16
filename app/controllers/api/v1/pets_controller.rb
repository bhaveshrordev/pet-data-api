class Api::V1::PetsController < ApplicationController

  # GET /Pets
  def index
    @pets = Pet.all
    render json: @pets
  end

  # GET /Pets/:id
  def show
    @pet = Pet.find(param[:id])
    render json: @pet
  end

  # POST /Pets
  def create
    @pet = Pet.new(Pet_params)
    if @pet.save
      render json: @pet
    else
      render error: { error: 'Unable to create Pet details' }, status: 400
    end
  end

  # PUT /Pets/:id
  def update
    @pet = Pet.find(params[:id])
    if @pet
      @pet.update(Pet_params)
      render json: { message: 'Pet Details Successfully Updated' }, status: 200
    else
      render json: { error: 'Unable to update Pet Details' }, status: 400
    end
  end

  # DELETE /Pets/:id
  def destroy
    @pet = Pet.find(params[:id])
    if @pet
      @pet.destroy
      render json: { message: 'Pet Details Successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete Pet Details' }, status: 400
    end
  end

  private

  def Pet_params
    params.require(:Pet).permit(:name, :color, :sex, :breed, :date_of_birth)
  end 
end
