require File.dirname(__FILE__) + '/../../spec_helper'

describe "/teams/edit.html.haml" do
  include TeamsHelper
  
  before do
    @teams = mock_model(Teams)
    @teams.stub!(:name).and_return("MyString")
    assigns[:teams] = @teams
  end

  it "should render edit form" do
    render "/teams/edit.html.haml"
    
    response.should have_tag("form[action=#{team_path(@teams)}][method=post]") do
      with_tag('input#teams_name[name=?]', "teams[name]")
    end
  end
end