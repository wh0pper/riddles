require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/riddle')

enable :sessions

before do
  @game = Riddles.new()
end

get('/') do
  erb(:welcome)
end

get('/riddle') do
  @current_riddle = @game.get_riddle
  session[:riddle] = @current_riddle
  erb(:riddle)
end

get('/result') do
  answer = @params.fetch('answer')
  @current_riddle = session[:riddle]
  if @game.eval?(answer,@current_riddle)
    redirect to('/riddle')
  else
    erb(:fail)
  end
end

get('riddle2') do
  @riddle2 = @game.get_riddle
  erb(:riddle2)
end
