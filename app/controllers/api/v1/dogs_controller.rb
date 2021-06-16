class Api::V1::DogsController < ApplicationController

  # GET /dogs
  def index
    @dogs = Dog.all
    render json: @dogs
  end

  # GET /dogs/:id
  def show
    @dog = Dog.find(param[:id])
    render json: @dog
  end

  # POST /dogs
  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      render json: @dog
    else
      render error: { error: 'Unable to create Dog details' }, status: 400
    end
  end

  # PUT /dogs/:id
  def update
    @dog = Dog.find(params[:id])
    if @dog
      @dog.update(dog_params)
      render json: { message: 'Dog Details Successfully Updated' }, status: 200
    else
      render json: { error: 'Unable to update Dog Details' }, status: 400
    end
  end

  # DELETE /dogs/:id
  def destroy
    @dog = Dog.find(params[:id])
    if @dog
      @dog.destroy
      render json: { message: 'Dog Details Successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete Dog Details' }, status: 400
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :color, :sex, :breed, :date_of_birth)
  end 
end
