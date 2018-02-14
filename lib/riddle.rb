class Riddles
attr_reader(:counter)
  def initialize
    @riddles = {
      'river' => 'What has a bed but doesnt sleep and a mouth but never eats?', 'shoe' => 'What has a soul but doesnt live and a tongue but cant taste?', 'plant' => 'You bury me when I’m alive and dig me up when I’m dead. What am I?',
      'shadow' => 'Sometimes I walk in front of you. Sometimes I walk behind you. It is only in the dark that I ever leave you. What am I?',
      'advice' => 'Most people need it, some ask for it, some give it, but almost nobody takes it. What is it?'
    }
    @counter = 0
  end

  def get_riddle
    values_array = @riddles.values
    @current_riddle = values_array[rand(values_array.size)]
    return @current_riddle
  end

  def eval?(input,riddle)
    if (@riddles.key(riddle) == input)
      @counter += 1
      return true
    else (@riddles.key(riddle) == input)
      return false
    end
  end

end
