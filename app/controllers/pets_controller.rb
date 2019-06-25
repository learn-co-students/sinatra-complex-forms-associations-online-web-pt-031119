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
    @pet = Pet.create(name: params[:pet][:pet_name])
    if params[:owner_name] && !params[:owner_name].empty?
      @pet.owner = Owner.create(name: params[:owner_name])
    elsif !params[:owner][:name].empty?
      @owner = Owner.create(name: params[:owner][:name])
      @pet.owner = @owner
      @owner.save
    end
    @pet.save
    redirect to :"/pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    @pet = Pet.find(params[:id])
    if !params[:owner][:name].empty?
      @owner = Owner.create(name: params[:owner][:name])
      @owner.save
      @pet.owner = @owner
      @pet.save
    else
      @pet.update(params[:pet])
      @pet.save
    end
    redirect to :"/pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  
  end
end
