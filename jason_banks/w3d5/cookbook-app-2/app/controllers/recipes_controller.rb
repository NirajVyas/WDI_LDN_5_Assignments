class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    # find_categories
  end

  def new
    @recipe = Recipe.new
    find_categories
    Ingredient.all.each do |ingredient|
      @recipe.ingredients_recipes.build(ingredient_id: ingredient.id)
    end
  end

  def create
    
    if ir = params[:recipe][:ingredients_recipes_attributes]
      ir.delete_if do |key, value|
        ir[key]['quantity'].blank?
      end
    end

    params[:recipe][:ingredients_recipes_attributes] = ir
    @recipe = Recipe.new(params[:recipe])


    if @recipe.save
      redirect_to(@recipe, notice: "#{@recipe.title} has been successfully added.")
    else
      find_categories
      Ingredient.all.each do |ingredient|
        @recipe.ingredients_recipes.build(ingredient_id: ingredient.id) unless @recipe.ingredients_recipes.map(&:ingredient_id).include?(ingredient.id)
      end
      render action: 'new'
    end
  end

  def show
    find_recipe
  end

  def edit
    find_recipe
    find_categories
    Ingredient.all.each do |ingredient|
      @recipe.ingredients_recipes.build(ingredient_id: ingredient.id) unless @recipe.ingredients_recipes.include?(ingredient.id)
    end
    
  end

  def update
    find_recipe

    ir = params[:recipe][:ingredients_recipes_attributes]
    ir.keys.each do |key|
      ir[key]["_destroy"] = true if ir[key]["quantity"].blank?
    end

    
    
    

    params[:recipe][:ingredients_recipes_attributes] = ir    
    params[:recipe][:title].capitalize!


    if @recipe.update_attributes(params[:recipe])
      redirect_to(@recipe, notice: "#{@recipe.title} has been successfully updated.")
    else
      find_categories
      Ingredient.all.each do |ingredient|
        @recipe.ingredients_recipes.build(ingredient_id: ingredient.id) unless @recipe.ingredients_recipes.map(&:ingredient_id).include?(ingredient.id)
      end
      render action: 'edit'
    end
  end

  def destroy
    Recipe.destroy(params[:id])
    redirect_to(recipes_path)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def find_ingredients
    @ingredients = Ingredient.all
  end

  def find_categories
    @categories = Category.find(:all, :select => "id, name")
  end

end
