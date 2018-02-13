require('rspec')
require('riddle')

describe('Riddles') do
  riddle_test = Riddles.new()

  describe('#get_riddle') do
    it('gets a random value from a hash containing riddles and their answers') do
      expect(riddle_test.get_riddle.is_a?(String)).to(eq(true))
    end

  end
  describe('#eval?') do
    it('compares input with the key answer') do
      expect(riddle_test.eval?('river','What has a bed but doesnt sleep and a mouth but never eats?')).to(eq(true)) 
    end
  end
end
