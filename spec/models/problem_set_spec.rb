require File.dirname(__FILE__) + '/../spec_helper'

describe Problem_set do
  before(:each) do
    @problem_set = Problem_set.new
  end

  it "should be valid" do
    @problem_set.should be_valid
  end
end
