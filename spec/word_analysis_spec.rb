require 'rspec'
require_relative '../lib/word_analysis'

describe 'Word Analytics' do
  let(:words){Words.new("A Faizaan is a wizard and is a Faizaan!?!")}

  it 'Instance variable equals parameter passed to Words class' do
    expect(words.text).to eq("A Faizaan is a wizard and is a Faizaan!?!")
  end

  it 'Counts the number of wizardly words' do
    expect(words.word_count).to eq(9)
  end

  it 'Counts the number of wizardly letters' do
    expect(words.element_count(/[a-zA-Z]/)).to eq(30)
  end

  it 'Counts the number of wizardly symbols' do
    expect(words.element_count(/[-!$%^&*()_+|~=`{}#@\[\]:";'<>?,.\/]/)).to eq(3)
  end

  it 'Counts the three most common wizardly words' do
    expect(words.common_words).to eq([["faizaan", 2], ["is", 2], ["a", 3]])
  end

  it 'Counts the three most common wizardly letters' do
    expect(words.common_letters).to eq([["n", 3], ["i", 5], ["a", 10]])
  end

  it 'Counts the number of unique wizardly words' do
    expect(words.unique_words).to eq(2)
  end

end

