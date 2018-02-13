require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the riddle path', {:type => :feature}) do
  it('processes user entry and generates new riddle') do
    visit('/')
    click_button('Get started')
    expect(page).to have_content('Your riddle')
  end
end
