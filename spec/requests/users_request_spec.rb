require 'rails_helper'

RSpec.describe 'users', type: :request do
    include Devise::Test::IntegrationHelpers
    before do        
        @user = User.create(username: 'Example', email: 'example@example.com', admin: false, password: 'password', password_confirmation: 'password')
        @user.save
        sign_in @user
    end

    describe '#index' do
        it 'shows the index page' do
            get '/users'
        end
    end

    describe '#show' do
        it 'shows a specific user page' do
            get "/users/#{@user.id}"
        end
    end
    
    describe '#new' do
        it 'shows the new user form' do
            get '/users/sign_up'
        end
    end

    describe '#edit' do
        include Devise::Test::IntegrationHelpers
        it 'shows the edit user form' do
            get "/users/edit"
        end
    end

    describe '#destroy' do
        it 'deletes an existing user' do
            expect {
                delete "/users"
            }.to change { User.count }.by -1
        end
    end
end