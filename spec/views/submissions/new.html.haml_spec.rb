require File.dirname(__FILE__) + '/../../spec_helper'

describe "/submissions/new.html.haml" do
  include SubmissionsHelper
  
  before do
    @submissions = mock_model(Submissions)
    @submissions.stub!(:new_record?).and_return(true)
    @submissions.stub!(:solved).and_return(false)
    @submissions.stub!(:member_id).and_return("1")
    @submissions.stub!(:team_id).and_return("1")
    @submissions.stub!(:problem_id).and_return("1")
    assigns[:submissions] = @submissions
  end

  it "should render new form" do
    render "/submissions/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", submissions_path) do
      with_tag("input#submissions_solved[name=?]", "submissions[solved]")
    end
  end
end
