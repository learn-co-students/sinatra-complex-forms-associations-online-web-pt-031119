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

  patch '/pets/:id' do   #update action, modifies existing instance specified by :id

    redirect to "pets/#{@pet.id}"
  end
end