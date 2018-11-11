require 'rails_helper'

RSpec.describe Revision, type: :model do
    before do
        @page = Page.create(locked: false, title: 'Test Page', body: 'Test text')
        @page.revisions.new(title: 'Test Page', contents: 'Test text')
        @page.revisions.new(title: 'Different Title', contents: 'Hello World!')
        @page.save
    end
    it 'is deleted when relevant page is' do
        revisions = @page.revisions
        @page.destroy
        revisions.each do |revision|
            expect(Revisions.find(id: revision.id).to be_nil)
        end
    end
    after do
        @page.destroy
    end
end