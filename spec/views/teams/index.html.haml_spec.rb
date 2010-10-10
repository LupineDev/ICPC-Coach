require File.dirname(__FILE__) + '/../../spec_helper'

describe "/teams/index.html.haml" do
  include TeamsHelper
  
  before do
    teams_98 = mock_model(Teams)
    teams_98.should_receive(:name).and_return("MyString")
    teams_99 = mock_model(Teams)
    teams_99.should_receive(:name).and_return("MyString")

    assigns[:teams] = [teams_98, teams_99]
  end

  it "should render list of teams" do
    render "/teams/index.html.haml"
    response.should have_tag("tr>td", "MyString", 2)
  end
end
