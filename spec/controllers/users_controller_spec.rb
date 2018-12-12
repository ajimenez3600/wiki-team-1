require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:valid_attributes) { }
    let(:invalid_attributes) { }
    let(:valid_session) { {} }

    before do
        @user = User.create(username: 'Example', email: 'example@example.com', admin: true, password: 'password', password_confirmation: 'password')
        sign_in @user
    end

    describe '#index' do
        it 'shows the index page' do
            get :index
            expect(response).to be_successful
        end
    end

    describe '#show' do
        it 'shows a specific user page' do
            get :show, params: { id: @user.id }
            expect(response).to be_successful
        end
    end
end
