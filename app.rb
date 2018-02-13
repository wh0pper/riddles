require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/riddle')

@riddles_array = ["What has a bed but doesn’t sleep and a mouth but never eats?", "What has a soul but doesn't live and a tongue but can't taste?", "You bury me when I’m alive and dig me up when I’m dead. What am I?"]

get('/') do
  erb(:welcome)
  @game = Riddles.new()
end

get('/riddle1') do
  @riddle = @game.get_riddle
  erb(:riddle)
end

post('/result') do
  answer = @params.fetch('answer')
  if @game.eval?(answer)
    erb(:riddle)
  else
    erb(:fail)
  end
end
