require 'Teller'
require 'stringio'
require_relative '../lib/messages.rb'

describe Teller do
  describe '#welcome' do
    it 'greets and provides options' do
      p subject.welcome()
      expect(subject.welcome).to eq('Hello')
    end
  end



end

# is instance of self
# does greet and options
# successfully puts 'how much'
#
#
#
