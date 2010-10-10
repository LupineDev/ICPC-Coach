require File.dirname(__FILE__) + '/../../spec_helper'

describe "/teams/show.html.haml" do
  include TeamsHelper
  
  before do
    @teams = mock_model(Teams)
    @teams.stub!(:name).and_return("MyString")

    assigns[:teams] = @teams
  end

  it "should render attributes in <p>" do
    render "/teams/show.html.haml"
    response.should have_text(/MyString/)
  end
end

