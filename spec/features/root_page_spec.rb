# frozen_string_literal: true

describe 'Welcome page', type: :feature do
  it 'Show welcome page', :js do
    visit '/'
    expect(page).to have_content('Rails version: 7.2.2.1')
  end
end
