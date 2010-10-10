require File.dirname(__FILE__) + '/../../spec_helper'

describe "/problem_sets/index.html.haml" do
  include ProblemSetsHelper
  
  before do
    problem_set_98 = mock_model(Problem_set)
    problem_set_98.should_receive(:name).and_return("MyString")
    problem_set_99 = mock_model(Problem_set)
    problem_set_99.should_receive(:name).and_return("MyString")

    assigns[:problem_sets] = [problem_set_98, problem_set_99]
  end

  it "should render list of problem_sets" do
    render "/problem_sets/index.html.haml"
    response.should have_tag("tr>td", "MyString", 2)
  end
end
