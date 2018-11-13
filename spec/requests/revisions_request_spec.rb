require 'rails_helper'

RSpec.describe 'revisions', type: :request do
    before do
        @page = Page.create(locked: false, title: 'Title', body: 'Body')
        @page.save
        patch "/pages/#{@page.title}", params: { page: { title: 'Title2', body: 'Body2' } }
    end

    describe '#index' do
        it 'shows the index page' do
            get '/revisions'
        end
    end

    describe '#show' do
        it 'shows a specific revision page' do
            get "/revisions/#{@page.revisions.first.id}"
        end
    end

    describe '#revert' do
        it 'reverts a page to a previous revision' do
            expect { 
                post "/revisions/#{@page.revisions.first.id}/revert"
            }.to change { @page.revisions.count }.by 1
            expect(@page.title).to eq 'Title'
            expect(@page.body).to eq 'Body'
        end
    end

    describe '#destroy' do
        it 'deletes a revision from history' do
            expect {
                delete "/revisions/#{@page.revisions.first.id}"
            }.to change { @page.revisions.count }.by -1
        end
    end
end