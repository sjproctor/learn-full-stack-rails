class HerbController < ApplicationController
  def index
    @herbs = Herb.all
  end

  def show
    @herb = Herb.find(params[:id])
    #return show.html.erb
  end

  def new
    @herb = Herb.new
  end

  def create
    @herb = Herb.create(herb_params)
    if @herb.valid?
      redirect_to herbs_path
    end
  end

  def edit
    @herb = Herb.find(params[:id])
  end

  def update
    @herb = Herb.find(params[:id])
    @herb.update(herb_params)
    if @herb.valid?
      redirect_to herb_path(@herb)
    end
  end

  def destroy
    @herb = Herb.find(params[:id])
    @herb.destroy
    redirect_to herbs_path
  end

  private
  def herb_params
    params.require(:herb).permit(:name, :watered)
  end
end
