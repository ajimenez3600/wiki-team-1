require 'rails_helper'

RSpec.describe 'pages', type: :request do
    before do
        @page = Page.create(locked: false, title: 'Title', body: 'Body')
        @page.save
    end

    describe '#index' do
        it 'shows the pages index page' do
            get '/pages'
        end
    end

    describe '#new' do
        it 'shows the new form page' do
            get "/pages/new"
        end
    end

    describe '#create' do
        it 'creates a new page and revision' do
            post '/pages', params: { page: { locked: false, title: 'NewTitle', body: 'Body' } }
            page = Page.last
            expect(page.title).to eq 'NewTitle'
            expect(page.body).to eq 'Body'
            expect(page.revisions.count).to eq 1
            expect(page.revisions.last.title).to eq 'NewTitle'
        end
        it 'should fail to create a new page when titles are not unique' do
            post '/pages', params: { page: { locked: false, title: 'Title', body: 'Fail' } }
            expect(Page.last.body).not_to eq 'Fail'
        end
        it 'should fail to create a new page' do
            post '/pages', params: { page: { locked: false, body: 'Fail' } }
            expect(Page.last.body).not_to eq 'Fail'
        end
    end

    describe '#show' do
        it 'shows the specific page called' do
            get "/pages/#{@page.title}"
        end
    end

    describe '#history' do
        it 'shows the revision history of a page' do
            get "/pages/#{@page.title}/history"
        end
    end

    describe '#edit' do
        it 'shows the edit form page' do
            get "/pages/#{@page.title}/edit"
        end
    end

    describe '#update' do
        it 'updates the page and creates a revision' do
            patch "/pages/#{@page.title}", params: { page: { title: 'Title2', body: 'Body2' } }
            page = Page.find(@page.id)
            expect(page.title).to eq 'Title2'
            expect(page.body).to eq 'Body2' 
            expect(page.revisions.last.title).to eq 'Title2'
            expect(page.revisions.last.contents).to eq 'Body2'
        end
        it 'should fail to update the page' do
            patch "/pages/#{@page.title}", params: { page: { locked: false, body: 'Fail' } }
            expect(@page.body).not_to eq 'Fail'
        end
    end

    describe '#destroy' do
        it 'destroys a page' do
            delete page_url(@page)
        end
    end
end
