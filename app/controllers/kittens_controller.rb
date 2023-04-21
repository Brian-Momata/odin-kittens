class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]
  def index
    @kittens = Kitten.all
  end
  
  def new
    @kitten = Kitten.new
  end
  

  def create
    @kitten = Kitten.new(params[:kitten])
    if @kitten.save
      flash[:success] = "Kitten successfully created"
      redirect_to @kitten
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
      if @kitten.update(params[:kitten])
        flash[:success] = "Kitten was successfully updated"
        redirect_to @kitten
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    if @kitten.destroy
      flash[:success] = 'Kitten was successfully deleted.'
      redirect_to kittens_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to kittens_url
    end
  end
  
  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end
end
