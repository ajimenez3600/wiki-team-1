require 'rails_helper'

RSpec.describe Page, type: :model do
    before do
        @page = Page.create(locked: false, title: 'Test Page', body: 'Test text')
        @page.revisions.new(title: 'Test Page', contents: 'Test text')
        @page.revisions.new(title: 'Different Title', contents: 'Hello World!')
        @page.save
    end
    it 'fetches the most recent revision' do
        revision = @page.revisions.last
        expect(revision.title).to eq('Different Title')
        expect(revision.contents).to eq('Hello World!')
    end
    it 'validates title' do
        @failPage = Page.create(locked: false, body: 'Test text')
        expect(@failPage.valid?).to be false
    end
    it 'validates body' do
        @failPage = Page.create(locked: false, title: 'Test Page')
        expect(@failPage.valid?).to be false
    end
    after do
        @page.destroy
    end
end