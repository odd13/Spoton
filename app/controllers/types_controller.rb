class TypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.all
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to :action => 'index' #render 'types/index' # Handle a successful save.
    else
      redirect_to :action => 'new'  #render 'types/new'
    end
  end

  def show
    @type = Type.find(params[:id])
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    flash[:success] = "Type deleted"
    redirect_to '/types'
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])
    if @type.update(type_params)
      @type.save
      redirect_to action: :index
    else
      render 'types/edit'
    end
  end

  private

    def type_params
      params.require(:type).permit(:name, :category)
    end

end
