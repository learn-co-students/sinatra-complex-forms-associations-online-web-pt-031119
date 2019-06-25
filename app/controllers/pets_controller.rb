class PetsController < ApplicationController

  get '/pets' do  ##index page to display all owners
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do #loads form for creating a new pet
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do   #received data from form
    @pet = Pet.create(params[:name])
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do     #shows one specific instance of the pet class
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do   #update action, modifies existing instance specified by :id

    redirect to "pets/#{@pet.id}"
  end
end