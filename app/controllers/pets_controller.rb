require 'pry'
class PetsController < ApplicationController
  get '/pets' do  ##index page to display all owners
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do #loads form for creating a new pet
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet]) 
    if !params["owner"]["name"].empty?
    @pet.owner = Owner.create(name: params["owner"]["name"])
    @pet.save
    end
    redirect "/pets/#{@pet.id}"
  end

  get '/pets/:id' do     #shows one specific instance of the pet class
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do     #edit an instance of the pet class
    @owners = Owner.all
    @pet = Pet.find_by_id(params[:id])
    erb :'/pets/edit'
  end

  patch '/pets/:id' do   #update action, modifies existing instance specified by :id
    ####### bug fix
    if !params[:pet].keys.include?("owner_id")
      params[:pet]["owner_id"] = []
      end
      #######
    
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
      @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end
end