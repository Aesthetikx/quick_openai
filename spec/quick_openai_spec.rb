# frozen_string_literal: true

RSpec.describe QuickOpenAI do
  it "has a version number" do
    expect(QuickOpenAI::VERSION).not_to be nil
  end

  it "returns a useful message without a token present" do
    allow(ENV).to receive(:key?).with("OPENAI_ACCESS_TOKEN").and_return(false)

    expect { "anything".gpt }.to raise_error(QuickOpenAI::Error, /token/i)
  end

  describe "gpt" do
    it "can use a generic gpt", :vcr do
      expect("What is two plus two? Respond with only the digit.".gpt.to_i).to eq(4)
    end

    it "can use gpt3", :vcr do
      expect("What is two plus two? Respond with only the digit.".gpt3.to_i).to eq(4)
    end

    it "can use gpt4", :vcr do
      expect("What is two plus two? Respond with only the digit.".gpt4.to_i).to eq(4)
    end
  end

  describe "dalle" do
    it "can use a generic dalle", :vcr do
      expect("a drawing of a cat in a hat".dalle).to be_a(Tempfile)
    end

    it "can use dalle2", :vcr do
      expect("a drawing of a cat in a hat".dalle2).to be_a(Tempfile)
    end

    it "can use dalle3", :vcr do
      expect("a drawing of a cat in a hat".dalle3).to be_a(Tempfile)
    end
  end
end
