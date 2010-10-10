require File.dirname(__FILE__) + '/../spec_helper'

describe ProblemSetsController, "#route_for" do

  it "should map { :controller => 'problem_sets', :action => 'index' } to /problem_sets" do
    route_for(:controller => "problem_sets", :action => "index").should == "/problem_sets"
  end
  
  it "should map { :controller => 'problem_sets', :action => 'new' } to /problem_sets/new" do
    route_for(:controller => "problem_sets", :action => "new").should == "/problem_sets/new"
  end
  
  it "should map { :controller => 'problem_sets', :action => 'show', :id => 1 } to /problem_sets/1" do
    route_for(:controller => "problem_sets", :action => "show", :id => 1).should == "/problem_sets/1"
  end
  
  it "should map { :controller => 'problem_sets', :action => 'edit', :id => 1 } to /problem_sets/1/edit" do
    route_for(:controller => "problem_sets", :action => "edit", :id => 1).should == "/problem_sets/1/edit"
  end
  
  it "should map { :controller => 'problem_sets', :action => 'update', :id => 1} to /problem_sets/1" do
    route_for(:controller => "problem_sets", :action => "update", :id => 1).should == "/problem_sets/1"
  end
  
  it "should map { :controller => 'problem_sets', :action => 'destroy', :id => 1} to /problem_sets/1" do
    route_for(:controller => "problem_sets", :action => "destroy", :id => 1).should == "/problem_sets/1"
  end
  
end

describe ProblemSetsController, "handling GET /problem_sets" do

  before do
    @problem_set = mock_model(Problem_set)
    Problem_set.stub!(:find).and_return([@problem_set])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all problem_sets" do
    Problem_set.should_receive(:find).with(:all).and_return([@problem_set])
    do_get
  end
  
  it "should assign the found problem_sets for the view" do
    do_get
    assigns[:problem_sets].should == [@problem_set]
  end
end

describe ProblemSetsController, "handling GET /problem_sets.xml" do

  before do
    @problem_set = mock_model(Problem_set, :to_xml => "XML")
    Problem_set.stub!(:find).and_return(@problem_set)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all problem_sets" do
    Problem_set.should_receive(:find).with(:all).and_return([@problem_set])
    do_get
  end
  
  it "should render the found problem_set as xml" do
    @problem_set.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ProblemSetsController, "handling GET /problem_sets/1" do

  before do
    @problem_set = mock_model(Problem_set)
    Problem_set.stub!(:find).and_return(@problem_set)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the problem_set requested" do
    Problem_set.should_receive(:find).with("1").and_return(@problem_set)
    do_get
  end
  
  it "should assign the found problem_set for the view" do
    do_get
    assigns[:problem_set].should equal(@problem_set)
  end
end

describe ProblemSetsController, "handling GET /problem_sets/1.xml" do

  before do
    @problem_set = mock_model(Problem_set, :to_xml => "XML")
    Problem_set.stub!(:find).and_return(@problem_set)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the problem_set requested" do
    Problem_set.should_receive(:find).with("1").and_return(@problem_set)
    do_get
  end
  
  it "should render the found problem_set as xml" do
    @problem_set.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ProblemSetsController, "handling GET /problem_sets/new" do

  before do
    @problem_set = mock_model(Problem_set)
    Problem_set.stub!(:new).and_return(@problem_set)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new problem_set" do
    Problem_set.should_receive(:new).and_return(@problem_set)
    do_get
  end
  
  it "should not save the new problem_set" do
    @problem_set.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new problem_set for the view" do
    do_get
    assigns[:problem_set].should equal(@problem_set)
  end
end

describe ProblemSetsController, "handling GET /problem_sets/1/edit" do

  before do
    @problem_set = mock_model(Problem_set)
    Problem_set.stub!(:find).and_return(@problem_set)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the problem_set requested" do
    Problem_set.should_receive(:find).and_return(@problem_set)
    do_get
  end
  
  it "should assign the found problem_set for the view" do
    do_get
    assigns[:problem_set].should equal(@problem_set)
  end
end

describe ProblemSetsController, "handling POST /problem_sets" do

  before do
    @problem_set = mock_model(Problem_set, :to_param => "1")
    Problem_set.stub!(:new).and_return(@problem_set)
  end
  
  def post_with_successful_save
    @problem_set.should_receive(:save).and_return(true)
    post :create, :problem_set => {}
  end
  
  def post_with_failed_save
    @problem_set.should_receive(:save).and_return(false)
    post :create, :problem_set => {}
  end
  
  it "should create a new problem_set" do
    Problem_set.should_receive(:new).with({}).and_return(@problem_set)
    post_with_successful_save
  end

  it "should redirect to the new problem_set on successful save" do
    post_with_successful_save
    response.should redirect_to(problem_set_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe ProblemSetsController, "handling PUT /problem_sets/1" do

  before do
    @problem_set = mock_model(Problem_set, :to_param => "1")
    Problem_set.stub!(:find).and_return(@problem_set)
  end
  
  def put_with_successful_update
    @problem_set.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @problem_set.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the problem_set requested" do
    Problem_set.should_receive(:find).with("1").and_return(@problem_set)
    put_with_successful_update
  end

  it "should update the found problem_set" do
    put_with_successful_update
    assigns(:problem_set).should equal(@problem_set)
  end

  it "should assign the found problem_set for the view" do
    put_with_successful_update
    assigns(:problem_set).should equal(@problem_set)
  end

  it "should redirect to the problem_set on successful update" do
    put_with_successful_update
    response.should redirect_to(problem_set_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe ProblemSetsController, "handling DELETE /problem_set/1" do

  before do
    @problem_set = mock_model(Problem_set, :destroy => true)
    Problem_set.stub!(:find).and_return(@problem_set)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the problem_set requested" do
    Problem_set.should_receive(:find).with("1").and_return(@problem_set)
    do_delete
  end
  
  it "should call destroy on the found problem_set" do
    @problem_set.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the problem_sets list" do
    do_delete
    response.should redirect_to(problem_sets_url)
  end
end
