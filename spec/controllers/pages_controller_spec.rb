require 'rails_helper'

RSpec.describe PagesController, type: :controller do
    let(:valid_attributes) { }
    let(:invalid_attributes) { }
    let(:valid_session) { {} }

    before do
        @user = User.create(username: 'Example', email: 'example@example.com', admin: true, password: 'password', password_confirmation: 'password')
        sign_in @user

        @page = Page.create(locked: false, title: 'Title', body: 'Body')
        @page.save
    end

    describe '#index' do
        it 'shows the pages index page' do
            get :index
            expect(response).to be_successful
        end
    end

    describe '#new' do
        it 'shows the new form page' do
            get :new
            expect(response).to be_successful
        end
    end

    describe '#create' do
        it 'creates a new page and revision' do
            post :create, params: { page: { title: 'NewTitle', body: 'Body' } }
            expect(response).to be_redirect

            page = Page.last
            expect(page.title).to eq 'NewTitle'
            expect(page.body).to eq 'Body'
            expect(page.revisions.count).to eq 1
            expect(page.revisions.last.title).to eq 'NewTitle'
        end
        it 'should fail to create a new page when titles are not unique' do
            post :create, params: { page: { title: 'Title', body: 'Fail' } }
            expect(response).to be_successful

            expect(Page.last.body).not_to eq 'Fail'
        end
        it 'should fail to create a new page' do
            post :create, params: { page: { body: 'Fail' } }
            expect(response).to be_successful

            expect(Page.last.body).not_to eq 'Fail'
        end
    end

    describe '#show' do
        it 'shows the specific page called' do
            get :show, params: { title: @page.title }
            expect(response).to be_successful
        end
    end

    describe '#history' do
        it 'shows the revision history of a page' do
            get :history, params: { title: @page.title }
            expect(response).to be_successful
        end
    end

    describe '#edit' do
        it 'shows the edit form page' do
            get :edit, params: { title: @page.title }
            expect(response).to be_successful
        end
    end

    describe '#update' do
        it 'updates the page and creates a revision' do
            patch :update, params: { title: @page.title, page: { title: 'Title2', body: 'Body2' } }
            expect(response).to be_redirect

            page = Page.find(@page.id)
            expect(page.title).to eq 'Title2'
            expect(page.body).to eq 'Body2' 
            expect(page.revisions.last.title).to eq 'Title2'
            expect(page.revisions.last.contents).to eq 'Body2'
        end
        it 'should fail to update the page' do
            patch :update, params: { title: @page.title, page: { body: 'Fail' } }
            expect(response).to be_redirect
            expect(@page.body).not_to eq 'Fail'
        end
    end

    describe '#destroy' do
        it 'destroys a page' do
            delete :destroy, params: { title: @page.title }
            expect(response).to be_redirect
        end
    end
end
