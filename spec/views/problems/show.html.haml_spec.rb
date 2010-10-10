require File.dirname(__FILE__) + '/../../spec_helper'

describe "/problems/show.html.haml" do
  include ProblemsHelper
  
  before do
    @problems = mock_model(Problems)
    @problems.stub!(:name).and_return("MyString")
    @problems.stub!(:description).and_return("MyText")
    @problems.stub!(:problem_set_id).and_return("1")

    assigns[:problems] = @problems
  end

  it "should render attributes in <p>" do
    render "/problems/show.html.haml"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

