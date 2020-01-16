require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it 'Should say hello to visitor' do
    visit '/'
    expect(page).to have_content('Welcome!')
    expect(page).to have_content('Register')
    expect(page).to have_content('Login')
  end
end
