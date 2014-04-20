class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    find_categories
    find_ingredients
  end

  def create
    recipe = Recipe.create(params[:recipe])
    flash_notice("Recipe") unless recipe.valid?

    redirect_to(recipes_path)
  end

  def show
    find_recipe
    find_ingredients
  end

  def edit
    find_recipe
    find_categories
    find_ingredients
  end

  def update
    recipe = find_recipe
    recipe.update_attributes(params[:recipe])
    flash_notice("Recipe") unless recipe.valid?

    redirect_to(recipes_path)
  end

  def destroy
    Recipe.destroy(params[:id])
    redirect_to(recipes_path)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def find_ingredients
    @ingredients = Ingredient.where(id: @recipe.ingredient_ids)
  end

  def find_categories
    @categories = Category.find(:all, :select => "id, name")
  end

end
