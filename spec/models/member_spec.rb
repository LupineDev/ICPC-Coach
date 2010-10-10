require File.dirname(__FILE__) + '/../spec_helper'

describe Members do
  before(:each) do
    @members = Members.new
  end

  it "should be valid" do
    @members.should be_valid
  end
end
