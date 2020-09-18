require 'rails_helper'

RSpec.describe DishesController, type: :controller do

    #GET Index

    describe 'GET#index' do
        before do
            get :index
        end

        it 'expected to assign menu instance variable' do
            expect(assigns[:dishes]).to eq(Dish.all)
        end

        it 'expected to render index template' do
            is_expected.to render_template(:index)
        end
    end
    
    #GET New

end