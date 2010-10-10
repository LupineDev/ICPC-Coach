require File.dirname(__FILE__) + '/../../spec_helper'

describe "/problems/edit.html.haml" do
  include ProblemsHelper
  
  before do
    @problems = mock_model(Problems)
    @problems.stub!(:name).and_return("MyString")
    @problems.stub!(:description).and_return("MyText")
    @problems.stub!(:problem_set_id).and_return("1")
    assigns[:problems] = @problems
  end

  it "should render edit form" do
    render "/problems/edit.html.haml"
    
    response.should have_tag("form[action=#{problem_path(@problems)}][method=post]") do
      with_tag('input#problems_name[name=?]', "problems[name]")
      with_tag('textarea#problems_description[name=?]', "problems[description]")
    end
  end
end