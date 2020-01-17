require 'rails_helper'

RSpec.describe 'As a logged in user', type: :feature do
  before(:each) do
    user = User.create!(email: "joe@fake.com", username: "tronkat", password: "test123", password_confirmation: "test123")
    visit '/'
    click_on "Login"
    fill_in :username, with: "tronkat"
    fill_in :password, with: "test123"
    click_on "Submit"
  end

  it 'should be able to log out' do

    click_on "Logout"

    expect(current_path).to eq('/')
    expect(page).to have_content('Login')
    expect(page).to have_content('Login')

    expect(page).to_not have_content('Logout')
    expect(page).to_not have_content('Welcome tronkat')
  end
end
