require File.dirname(__FILE__) + '/../../spec_helper'

describe "/problem_sets/new.html.haml" do
  include ProblemSetsHelper
  
  before do
    @problem_set = mock_model(Problem_set)
    @problem_set.stub!(:new_record?).and_return(true)
    @problem_set.stub!(:name).and_return("MyString")
    assigns[:problem_set] = @problem_set
  end

  it "should render new form" do
    render "/problem_sets/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", problem_sets_path) do
      with_tag("input#problem_set_name[name=?]", "problem_set[name]")
    end
  end
end
