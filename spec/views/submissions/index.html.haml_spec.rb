require File.dirname(__FILE__) + '/../../spec_helper'

describe "/submissions/index.html.haml" do
  include SubmissionsHelper
  
  before do
    submissions_98 = mock_model(Submissions)
    submissions_98.should_receive(:solved).and_return(false)
    submissions_98.should_receive(:member_id).and_return("1")
    submissions_98.should_receive(:team_id).and_return("1")
    submissions_98.should_receive(:problem_id).and_return("1")
    submissions_99 = mock_model(Submissions)
    submissions_99.should_receive(:solved).and_return(false)
    submissions_99.should_receive(:member_id).and_return("1")
    submissions_99.should_receive(:team_id).and_return("1")
    submissions_99.should_receive(:problem_id).and_return("1")

    assigns[:submissions] = [submissions_98, submissions_99]
  end

  it "should render list of submissions" do
    render "/submissions/index.html.haml"
    response.should have_tag("tr>td", false, 2)
  end
end
