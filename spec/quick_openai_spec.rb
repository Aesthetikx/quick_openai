# frozen_string_literal: true

RSpec.describe QuickOpenai do
  it "has a version number" do
    expect(QuickOpenai::VERSION).not_to be nil
  end

  it "can use gpt3", :vcr do
    expect("What is two plus two, as a single digit?".gpt3.to_i).to eq(4)
  end

  it "can use dalle2", :vcr do
    expect("a drawing of a cat in a hat".dalle2).to be_a(Tempfile)
  end
end
