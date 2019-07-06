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
    #binding.pry
    @pet = Pet.create(name: params[:pet][:name]) 
    #binding.pry
    if params[:pet][:owner_ids] 
      @pet.owner_id = params[:pet][:owner_ids][0]

    elsif params[:owner_name]  
      @owner = Owner.create(name: params[:owner_name])        
      @pet.owner = @owner
      #binding.pry   
    end
      @pet.save  
    if !params["owner"]["name"].empty?
      @owner = Owner.create(name: params["owner"]["name"]) 
      @pet.update(owner: @owner)
    end      
    redirect to "/pets/#{@pet.id}"
  end

  get '/pets/:id' do    
    @pet = Pet.find(params[:id])    
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end 

  patch '/pets/:id' do
    #binding.pry
    # if !params[:pet].keys.include?("owner_ids")
    #   params[:pet]["owner_id"] = []      
    #end 

    @pet = Pet.find(params[:id])
    @pet.update(params["pet"]) 
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    @pet.save  
    redirect to "pets/#{@pet.id}"
  end
end