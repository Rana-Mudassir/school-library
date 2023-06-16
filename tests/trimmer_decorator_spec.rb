require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double("Nameable") }
  let(:trimmer_decorator) { described_class.new(nameable) }

  describe "#correct_name" do
    it "returns a trimmed name when it has more than 10 characters" do
      allow(nameable).to receive(:correct_name).and_return("Very Long Name")
      expect(trimmer_decorator.correct_name).to eq("Very Long ")
    end

    it "returns the original name when it has 10 or fewer characters" do
      allow(nameable).to receive(:correct_name).and_return("Short Name")
      expect(trimmer_decorator.correct_name).to eq("Short Name")
    end
  end
end