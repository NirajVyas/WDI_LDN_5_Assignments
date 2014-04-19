class RecipesController < ApplicationController

 def index
     @recipes = Recipe.all
   end
 
   def new
     @recipe = Recipe.new
   end
 
   def create
     Recipe.create(params[:recipe])
     redirect_to recipes_path
   end
 
   def edit
     @recipe = Recipe.find(params[:id])
   end

   def update
     @recipe = Recipe.find(params[:id])
         @recipe.update_attributes(params[:recipe])
         redirect_to recipes_path
   end
 
   def destroy
       @recipe = Recipe.find(params[:id])
       @recipe.destroy
       redirect_to recipes_path
   end
 
 end
