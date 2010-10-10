require File.dirname(__FILE__) + '/../../spec_helper'

describe "/problem_sets/show.html.haml" do
  include ProblemSetsHelper
  
  before do
    @problem_set = mock_model(Problem_set)
    @problem_set.stub!(:name).and_return("MyString")

    assigns[:problem_set] = @problem_set
  end

  it "should render attributes in <p>" do
    render "/problem_sets/show.html.haml"
    response.should have_text(/MyString/)
  end
end

