class DishesController < ApplicationController
    def custom
        render plain: params
    end
    def edit
        @menu = Menu.find(params[:menu_id])
        @dish = Dish.find(params[:id])
        
    end
    def show
        render plain: "show"
    end

    def create
      @menu = Menu.find(params[:menu_id])
      @dish = @menu.dish.create(dish_params)
      redirect_to menu_path(@menu)
    end

    def update
        render plain: "here in update"
    end

    def destroy
        @menu = Menu.find(params[:menu_id])
        @dish = @menu.dish.find(params[:id])
        @dish.destroy

        redirect_to menu_path(@menu)

    end

    private
      def dish_params
          params.require(:dish).permit(:name, :cateogry)
      end

end
  