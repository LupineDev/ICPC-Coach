require File.dirname(__FILE__) + '/../../spec_helper'

describe "/teams/new.html.haml" do
  include TeamsHelper
  
  before do
    @teams = mock_model(Teams)
    @teams.stub!(:new_record?).and_return(true)
    @teams.stub!(:name).and_return("MyString")
    assigns[:teams] = @teams
  end

  it "should render new form" do
    render "/teams/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", teams_path) do
      with_tag("input#teams_name[name=?]", "teams[name]")
    end
  end
end
