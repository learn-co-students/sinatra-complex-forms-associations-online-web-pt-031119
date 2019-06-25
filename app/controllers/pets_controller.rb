require 'pry'

class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    # binding.pry
    @pet = Pet.create(name: params[:pet][:pet_name])
    if !params[:owner_name].empty?
      @pet.owner = Owner.create(name: params[:owner_name])
    elsif !params[:owner][:name].empty?
      @owner = Owner.create(name: params[:owner][:name])
      @pet.owner = @owner
      @owner.save
    end
    @pet.save
    # binding.pry
    redirect to :"/pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to :"/pets/#{@pet.id}"
  end
end
