require 'spec_helper'

RSpec.describe Parser do
  subject(:parser) { described_class.new(valid_commands:valid_commands) }
  let(:valid_commands) { %w(PLACE MOVE COMMANDO UNDERPANTS) }

  describe '#valid?' do
    context 'given a set of commands' do
      it 'will return true for valid commands' do
        expect(parser.valid?("PLACE")).to eq(true)
      end

      it 'will not matter about case' do
        expect(parser.valid?("PlAcE")).to eq(true)
      end

      it 'returns false if the command isnt valid' do
        expect(parser.valid?("Batman")).to eq(false)
      end
    end
  end
end
