require File.dirname(__FILE__) + '/../../spec_helper'

describe "/problem_set/edit.html.haml" do
  include ProblemSetsHelper
  
  before do
    @problem_set = mock_model(Problem_set)
    @problem_set.stub!(:name).and_return("MyString")
    assigns[:problem_set] = @problem_set
  end

  it "should render edit form" do
    render "/problem_sets/edit.html.haml"
    
    response.should have_tag("form[action=#{problem_set_path(@problem_set)}][method=post]") do
      with_tag('input#problem_set_name[name=?]', "problem_set[name]")
    end
  end
end