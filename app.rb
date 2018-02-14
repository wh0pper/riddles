require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/riddle')

enable :sessions
set :game, Riddles.new()

get('/') do
  erb(:welcome)
end

get('/riddle') do
  @current_riddle = settings.game.get_riddle
  session[:riddle] = @current_riddle
  erb(:riddle)
end

get('/result') do
  answer = @params.fetch('answer')
  @current_riddle = session[:riddle]
  puts settings.game.counter
  if settings.game.counter < 3
    if settings.game.eval?(answer,@current_riddle)
      print 'correct'
      redirect to('/riddle')
    else
      print 'wrong'
      erb(:fail)
    end
  else
    erb(:success)
  end
end
