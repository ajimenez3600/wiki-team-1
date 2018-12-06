require 'rails_helper'

RSpec.describe 'users', type: :request do
    before do        
        @user = User.create(name: 'Example', email: 'example@example.com', admin: false, password: 'p', password_confirmation: 'p')
        @user.save
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
            get '/users/new'
        end
    end

    describe '#edit' do
        it 'shows the edit user form' do
            get "/users/#{@user.id}/edit"
        end
    end

    describe '#destroy' do
        it 'deletes an existing user' do
            expect {
                delete "/users/#{@user.id}"
            }.to change { User.count }.by -1
        end
    end
end