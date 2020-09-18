class MenusController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :is_admin?, only:[:edit ,:destroy]
  layout :choose_layout

  def index
    @menus = Menu.all
    @dishes = Dish.all
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end
  
  def show
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to @menu
    else 
      render 'new'
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
        redirect_to @menu
    else
        render 'new'
    end 
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    redirect_to menus_path
  end

  private
    def menu_params
      params.require(:menu).permit(:name)
    end

    def choose_layout
      if current_user && current_user.admin?
        "admin"
      elsif current_user
        "user"
      else
        "application"
      end
    end

    def is_admin?
      redirect_to root_path unless current_user.admin?
    end
end
