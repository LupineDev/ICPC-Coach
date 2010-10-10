require File.dirname(__FILE__) + '/../spec_helper'

describe Teams do
  before(:each) do
    @teams = Teams.new
  end

  it "should be valid" do
    @teams.should be_valid
  end
end
