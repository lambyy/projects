class CatsController < ApplicationController
  before_action :login_check, only: [:new, :create]
  before_action :ownership_check, only: [:edit, :update]

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

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end

  def login_check
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def ownership_check
    # current_user.cats.any? { |cat| cat.id == params[:id] }
    unless current_user && current_user.cats.exists?(id: params[:id])
      flash[:errors] = ["You can only edit your cats!"]
      redirect_to cat_url(params[:id])
    end
  end
end
