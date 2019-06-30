require 'pry'
class OwnersController < ApplicationController

  get '/owners' do    #index page to display all owners
    @owners = Owner.all
    erb :'/owners/index' 
  end

  get '/owners/new' do   #loads form for creating a new owner
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do   #loads form for editing an owner (specified by :id)
    @pets = Pet.all
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do  #shows one specific instance of the owner class
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  patch '/owners/:id' do   #update action, modifies existing instance specified by :id
     ####### bug fix
     if !params[:owner].keys.include?("pet_ids")
      params[:owner]["pet_ids"] = []
      end
      #######
   
      @owner = Owner.find(params[:id])
      @owner.update(params["owner"])
      if !params["pet"]["name"].empty?
        @owner.pets << Pet.create(name: params["pet"]["name"])
      end
      redirect "owners/#{@owner.id}"
  end
end