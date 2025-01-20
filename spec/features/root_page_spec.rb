# frozen_string_literal: true

describe 'Welcome page', type: :feature do
  it 'Show welcome page', :js do
    visit '/'
    screenshot_and_save_page
    expect(page).to have_content('Rails version: 7.2.2.1')
  end
end
