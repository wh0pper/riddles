class Riddles
  def initialize
    @riddles = {
      'river' => 'What has a bed but doesnt sleep and a mouth but never eats?', 'shoe' => 'What has a soul but doesnt live and a tongue but cant taste?', 'plant' => 'You bury me when I’m alive and dig me up when I’m dead. What am I?'
    }

    @riddles_array = ['What has a bed but doesn’t sleep and a mouth but never eats?', 'What has a soul but doesnt live and a tongue but cant taste?', 'You bury me when I’m alive and dig me up when I’m dead. What am I?']
  end

  def get_riddle
    @riddles.fetch('river')
  end

  def eval?
  end

end
