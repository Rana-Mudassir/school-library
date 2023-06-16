require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  let(:capitalize_decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'returns the name with the first letter capitalized' do
      allow(nameable).to receive(:correct_name).and_return('john')
      expect(capitalize_decorator.correct_name).to eq('John')
    end
  end
end
