require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a user' do
    expect {
      @user = User.create(username: 'Test', email: 'user@example.com', password: 'password', password_confirmation: 'password')
      expect(@user.valid?).to be true
    }.to change { User.count }.by 1
  end
  it 'validates email' do
    @user = User.create(username: 'Test', email: 'email', password: 'password', password_confirmation: 'password')
    expect(@user.valid?).to be false
  end
  it 'validates password' do
    @user = User.create(username: 'Test', email: 'user@example', password: 'p', password_confirmation: 'p')
    expect(@user.valid?).to be false
  end
  it 'checks password confirmation' do
    @user = User.create(username: 'Test', email: 'user@example.com', password: 'password', password_confirmation: 'confirmation')
    expect(@user.valid?).to be false
  end
end
