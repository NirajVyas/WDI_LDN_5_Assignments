class IngredientsController < ApplicationController
def new
  @ingredient = Ingredient.new
end

def create
  @ingredient = Ingredient.create(params[:ingredient])

  if @ingredient.save
    redirect_to(root_path)
  else
    render action: 'new'
  end
end
end