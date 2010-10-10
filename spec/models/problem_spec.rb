require File.dirname(__FILE__) + '/../spec_helper'

describe Problems do
  before(:each) do
    @problems = Problems.new
  end

  it "should be valid" do
    @problems.should be_valid
  end
end
