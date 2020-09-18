require 'rails_helper'

RSpec.describe MenusController, type: :controller do

    #GET Index

    describe 'GET#index' do
        before do
            get :index
        end

        it 'expected to assign menu instance variable' do
            expect(assigns[:menus]).to eq(Menu.all)
        end

        it 'expected to render index template' do
            is_expected.to render_template(:index)
        end
    end
    
    #GET New

    describe 'GET#new' do
        before do
            get :new
        end

        it 'expected to assign new menu instance' do
            expect(assigns[:menu]).to be_an_instance_of(Menu)
        end

        it 'expected to render new template' do
            is_expected.to render_template(:new)
        end

        # 
        # it 'expected to render admin layout' do
        #     if current_user && current_user.admin
        #         is_expected.to render_template(:admin)
        #     end
        # end
        # 
    end

    #post action

    describe 'POST # create' do
        before do
            post :create, params: params
        end

        context 'When Params are correct... ' do
            let(:params) {{ menu: {name: "test menu" } }}

            it 'is expected to create a new menu' do
                expect(assigns[:menu]).to be_an_instance_of(Menu)
            end

            it 'is expected to have name assigned to it' do
                expect(assigns[:menu].name).to eq("test menu")
            end

            # it 'is expected to redirect to menu path' do
            #     is_expected.to redirect_to :menu
            #   end

        end

        context 'When Params are incorrect..' do
            let(:params) {{ menu: {name: ' '} }}

            it 'is expected to render new template' do
                is_expected.to render_template(:new)
            end

            it 'is expected to add errors to name attribute' do
                expect(assigns[:menu].errors[:name]).to eq(["can't be blank", "is too short (minimum is 4 characters)"])
            end

        end

    end

    #edit action

    describe 'GET# edit' do
        before do
            get :edit, params: params
        end

        context 'When Menu ID is valid' do
            let(:menu) {{ menu: {name:'test-menu'} }}
            let(:params) {{ id: menu.id }}
        
            it 'is expected to set menu instance variable' do
                expect(assigns[:menu]).to eq(Menu.find_by(id: params[:id]))
            end
        
            # it 'is expected to render edit template' do
            #     is_expected.to render_template(:edit)
            # end
        
        
        end
    end
end