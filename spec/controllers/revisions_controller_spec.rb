require 'rails_helper'

RSpec.describe RevisionsController, type: :controller do
    let(:valid_attributes) { }
    let(:invalid_attributes) { }
    let(:valid_session) { {} }

    before do
        @user = User.create(username: 'Example', email: 'example@example.com', admin: true, password: 'password', password_confirmation: 'password')
        sign_in @user

        @page = Page.create(locked: false, title: 'Title', body: 'Body')
        @revision1 = Revision.create(version: 1, page: @page, user: @user, title: 'Title', contents: 'Body')
        @revision2 = Revision.create(version: 2, page: @page, user: @user, title: 'Title2', contents: 'Body2')
    end

    describe '#index' do
        it 'shows the index page' do
            get :index
            expect(response).to be_successful
        end
    end

    describe '#show' do
        it 'shows a specific revision page' do
            get :show, params: { id: @revision1.id }
            expect(response).to be_successful
        end
    end

    describe '#revert' do
        it 'reverts a page to a previous revision' do
            expect {
                post :revert, params: { id: @revision1.id }
                expect(response).to be_redirect
            }.to change { @page.revisions.count }.by 1
            expect(@page.title).to eq 'Title'
            expect(@page.revisions.last.contents).to eq 'Body'
        end
    end

    describe '#destroy' do
        it 'deletes a revision from history' do
            expect {
                delete :destroy, params: { id: @revision1.id }
                expect(response).to be_redirect
            }.to change { @page.revisions.count }.by -1
        end
    end
end