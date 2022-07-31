class RecipeesController < ApplicationController
  def index
    @recipees = Recipee.all
  end

  def show
    @recipee = Recipee.find(params[:id])
  end

  def new
    @recipee = Recipee.new
  end

  def edit
    @recipee = Recipee.find(params[:id])
  end

  def update
    @recipee = Recipee.find(params[:id])
    if @recipee.update(recipee_params)
      flash[:success] = "Your Recipee was updated successfully!"
      redirect_to recipee_path
    else
      render :edit, status: "422"
    end
  end

  def create
    @recipee = Recipee.new(recipee_params)
    @recipee.chef = Chef.find(2)
    if @recipee.save
      flash[:success] = "Your Recipee was created successfully!"
      redirect_to recipees_path
     else
       render :new, status: "422"
    end
  end

  private
    def recipee_params
      params.require(:recipee).permit(:name, :summary, :description)
    end
end
