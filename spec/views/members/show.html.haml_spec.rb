require File.dirname(__FILE__) + '/../../spec_helper'

describe "/members/show.html.haml" do
  include MembersHelper
  
  before do
    @members = mock_model(Members)
    @members.stub!(:name).and_return("MyString")
    @members.stub!(:email).and_return("MyString")
    @members.stub!(:notes).and_return("MyText")
    @members.stub!(:team_id).and_return("1")

    assigns[:members] = @members
  end

  it "should render attributes in <p>" do
    render "/members/show.html.haml"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

