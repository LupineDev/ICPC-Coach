require File.dirname(__FILE__) + '/../../spec_helper'

describe "/submissions/edit.html.haml" do
  include SubmissionsHelper
  
  before do
    @submissions = mock_model(Submissions)
    @submissions.stub!(:solved).and_return(false)
    @submissions.stub!(:member_id).and_return("1")
    @submissions.stub!(:team_id).and_return("1")
    @submissions.stub!(:problem_id).and_return("1")
    assigns[:submissions] = @submissions
  end

  it "should render edit form" do
    render "/submissions/edit.html.haml"
    
    response.should have_tag("form[action=#{submission_path(@submissions)}][method=post]") do
      with_tag('input#submissions_solved[name=?]', "submissions[solved]")
    end
  end
end