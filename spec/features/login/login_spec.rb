require "rails_helper"

RSpec.describe 'As a visitor logging in', type: :feature do
  before(:each) do
    @user = User.create!(email: "joe@fake.com", username: "tronkat", password: "test123", password_confirmation: "test123")
  end

  it 'should log me in with correct credentials' do
    visit '/'
    click_on "Login"
    expect(current_path).to eq('/login')

    fill_in :username, with: "tronkat"
    fill_in :password, with: "test123"
    click_on "Submit"

    expect(current_path).to eq('/')
    expect(page).to have_content('Logout')
    expect(page).to have_content('Welcome tronkat')
  end

  it 'should not log me in when password is incorrect' do
    visit '/'
    click_on "Login"
    expect(current_path).to eq('/login')

    fill_in :username, with: "tronkat"
    fill_in :password, with: "test122"
    click_on "Submit"

    expect(current_path).to eq('/login')
    expect(page).to have_content('Login')
    expect(page).to have_content("Username and/or password is incorrect.")
  end

  it 'should not log me in when username is not found' do
    visit '/'
    click_on "Login"
    expect(current_path).to eq('/login')

    fill_in :username, with: "tronkatt"
    fill_in :password, with: "test123"
    click_on "Submit"

    expect(current_path).to eq('/login')
    expect(page).to have_content('Login')
    expect(page).to have_content("Username and/or password is incorrect.")
  end
end
