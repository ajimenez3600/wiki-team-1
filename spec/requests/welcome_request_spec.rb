require 'rails_helper'

RSpec.describe 'welcome', type: :request do
    describe '#index' do
        it 'shows the root page' do
            get '/'
        end
    end
end