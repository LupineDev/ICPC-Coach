require File.dirname(__FILE__) + '/../../spec_helper'

describe "/members/new.html.haml" do
  include MembersHelper
  
  before do
    @members = mock_model(Members)
    @members.stub!(:new_record?).and_return(true)
    @members.stub!(:name).and_return("MyString")
    @members.stub!(:email).and_return("MyString")
    @members.stub!(:notes).and_return("MyText")
    @members.stub!(:team_id).and_return("1")
    assigns[:members] = @members
  end

  it "should render new form" do
    render "/members/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", members_path) do
      with_tag("input#members_name[name=?]", "members[name]")
      with_tag("input#members_email[name=?]", "members[email]")
      with_tag("textarea#members_notes[name=?]", "members[notes]")
    end
  end
end
