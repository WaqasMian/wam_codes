class DishesController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?, only: [:custom,:edit,:destroy]
    layout :choose_layout

    
    def custom
        @menu = Menu.find(params[:id])
    end

    def index
      @dishes = Dish.all
    end

    def edit
        @menu = Menu.find(params[:menu_id])
        @dish = Dish.find(params[:id])
    end

    def show
      @menu = Menu.find(params[:menu_id])
      @dish = Dish.find(params[:id])

      @dish.visits ||= 0
      @dish.visits = @dish.visits + 1
      @count = @dish.visits

      @dish.save
    end

    def create

      @menu = Menu.find(params[:menu_id])
      @dish = Dish.create(dish_params)
      @dish.visits=0
      @dish.save
      @menu.dish << @dish
      @menu.save
      redirect_to menu_path(@menu)
    end

    def update
        @menu = Menu.find(params[:menu_id])
        @dish = Dish.find(params[:id])

        if @dish.update(dish_params)
            redirect_to menu_path(@menu)
        else 
            render "custom"
        end
    end

    def destroy
        @menu = Menu.find(params[:menu_id])
        @dish = @menu.dish.find(params[:id])
        @dish.destroy

        redirect_to menu_path(@menu)

    end

    private
      def dish_params
          params.require(:dish).permit(:name, :cateogry, :price)
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
  