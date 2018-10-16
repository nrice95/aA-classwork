class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def update
    @cat = Cat.find(params[:id])

      if @cat.update(cat_params)
        redirect_to cat_url(@cat)
      else

        flash[:errors] = cat.errors.full_messages
        redirect_to cat_url(@cat)
      end
  end

  def edit
    
  end

  def create
    # debugger
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def cat_params
    params.require(:cat).permit(:birth_date,:sex,:name,:color,:description)
  end

end
