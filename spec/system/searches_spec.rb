require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'allows the user to perform a valid search' do
    visit root_path
    fill_in 'Enter your search query...', with: 'Valid query'
    click_button 'Search'
    
    expect(page).to have_content('Recent Searches')
    expect(page).to have_content('Valid query')
  end

  it 'shows an error for a short search query' do
    visit root_path
    fill_in 'Enter your search query...', with: '1234'
    click_button 'Search'
    
    expect(page).to have_content('Query is too short. Please enter at least 5 characters.')
  end

  it 'shows top searches' do
    Search.create!(query: 'Popular query', ip_address: '127.0.0.1')
    visit analytics_top_searches_path
    
    expect(page).to have_content('Top Searches')
    expect(page).to have_content('Popular query')
  end
end
