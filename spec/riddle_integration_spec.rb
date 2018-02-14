require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
enable :sessions
describe('the riddle path', {:type => :feature}) do
  it('processes user entry and generates new riddle') do
    visit('/')
    click_button('Get started')
    expect(page).to have_content('Your riddle')
  end
end
describe('the fail path', {:type => :feature}) do
  it('send user to failure page') do
    visit('/riddle')
    fill_in('answer', :with => 'test')
    click_button('Submit')
    expect(page).to have_content('You fail!')
  end
end
