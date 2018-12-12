require 'rails_helper'

RSpec.describe "blacklists/index", type: :view do
  before(:each) do
    assign(:blacklists, [
      Blacklist.create!(),
    ])
  end

  it "renders a list of blacklists" do
    render
  end
end
