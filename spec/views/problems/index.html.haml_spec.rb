require File.dirname(__FILE__) + '/../../spec_helper'

describe "/problems/index.html.haml" do
  include ProblemsHelper
  
  before do
    problems_98 = mock_model(Problems)
    problems_98.should_receive(:name).and_return("MyString")
    problems_98.should_receive(:description).and_return("MyText")
    problems_98.should_receive(:problem_set_id).and_return("1")
    problems_99 = mock_model(Problems)
    problems_99.should_receive(:name).and_return("MyString")
    problems_99.should_receive(:description).and_return("MyText")
    problems_99.should_receive(:problem_set_id).and_return("1")

    assigns[:problems] = [problems_98, problems_99]
  end

  it "should render list of problems" do
    render "/problems/index.html.haml"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end
