require 'rails_helper'

RSpec.describe "As an unregisted visitor", type: :feature do
  it 'Should be able to create a new user' do
    visit '/'
    click_on "Register"

    expect(current_path).to eq("/users/new")
    fill_in :email, with: "joe@fake.com"
    fill_in :username, with: "tronkat"
    fill_in :password, with: "test123"
    fill_in :password_confirmation, with: "test123"

    click_on "Create Account"
    expect(current_path).to eq("/")

    expect(page).to have_content("Account Created!")
  end

  it 'Should not create a new user if email is taken' do
    user = User.create!(email: "joe@fake.com", username: "katron", password: "test123", password_confirmation: "test123")
    visit '/'
    click_on "Register"

    expect(current_path).to eq("/users/new")
    fill_in :email, with: "joe@fake.com"
    fill_in :username, with: "tronkat"
    fill_in :password, with: "test123"
    fill_in :password_confirmation, with: "test123"

    click_on "Create Account"
    expect(current_path).to eq("/users/new")
    
    expect(page).to have_content("Account not created. Email already taken.")
  end

  it 'Should not create a new user if password and confirmation donot match' do
    visit '/'
    click_on "Register"

    expect(current_path).to eq("/users/new")
    fill_in :email, with: "new@fake.com"
    fill_in :username, with: "tronkat"
    fill_in :password, with: "test123"
    fill_in :password_confirmation, with: "test122"

    click_on "Create Account"
    expect(current_path).to eq("/users/new")
    
    expect(page).to have_content("Account not created. Password and confirmation do not match.")
  end
end
