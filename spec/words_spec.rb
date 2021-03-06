# frozen_string_literal: true

require "spec_helper"

describe ActsAsVotable::Helpers::Words do
  let(:vote) { build(:vote) }

  it "should know that like is a true vote" do
    expect(vote.votable_words.that_mean_true).to include "like"
  end

  it "should know that bad is a false vote" do
    expect(vote.votable_words.that_mean_false).to include "bad"
  end

  it "should be a vote for true when word is good" do
    expect(vote.votable_words.meaning_of("good")).to eq :positive
  end

  it "should be a vote for false when word is down" do
    expect(vote.votable_words.meaning_of("down")).to eq :negative
  end

  it "should be a vote for neutral when word is neutral" do
    expect(vote.votable_words.meaning_of("neutral")).to eq :neutral
  end

  it "should be a vote for true when the word is unknown" do
    expect(vote.votable_words.meaning_of("lsdhklkadhfs")).to eq :positive
  end
end
