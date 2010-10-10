require File.dirname(__FILE__) + '/../../spec_helper'

describe "/members/index.html.haml" do
  include MembersHelper
  
  before do
    members_98 = mock_model(Members)
    members_98.should_receive(:name).and_return("MyString")
    members_98.should_receive(:email).and_return("MyString")
    members_98.should_receive(:notes).and_return("MyText")
    members_98.should_receive(:team_id).and_return("1")
    members_99 = mock_model(Members)
    members_99.should_receive(:name).and_return("MyString")
    members_99.should_receive(:email).and_return("MyString")
    members_99.should_receive(:notes).and_return("MyText")
    members_99.should_receive(:team_id).and_return("1")

    assigns[:members] = [members_98, members_99]
  end

  it "should render list of members" do
    render "/members/index.html.haml"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end
