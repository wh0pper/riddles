require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/riddle')

enable :sessions
set :game, Riddles.new()
before do
  # @game = Riddles.new()
  puts "new object"
end

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
  until (settings.game.counter == 3) do
    puts settings.game.counter
    if settings.game.eval?(answer,@current_riddle)
    redirect to('/riddle')
    else
      erb(:fail)
    end
  end
  erb(:success)
end

# get('riddle2') do
#   @riddle2 = settings.game.get_riddle
#   erb(:riddle2)
# end
