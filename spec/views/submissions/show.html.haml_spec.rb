require File.dirname(__FILE__) + '/../../spec_helper'

describe "/submissions/show.html.haml" do
  include SubmissionsHelper
  
  before do
    @submissions = mock_model(Submissions)
    @submissions.stub!(:solved).and_return(false)
    @submissions.stub!(:member_id).and_return("1")
    @submissions.stub!(:team_id).and_return("1")
    @submissions.stub!(:problem_id).and_return("1")

    assigns[:submissions] = @submissions
  end

  it "should render attributes in <p>" do
    render "/submissions/show.html.haml"
    response.should have_text(/als/)
  end
end

