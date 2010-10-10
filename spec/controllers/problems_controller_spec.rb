require File.dirname(__FILE__) + '/../spec_helper'

describe ProblemsController, "#route_for" do

  it "should map { :controller => 'problems', :action => 'index' } to /problems" do
    route_for(:controller => "problems", :action => "index").should == "/problems"
  end
  
  it "should map { :controller => 'problems', :action => 'new' } to /problems/new" do
    route_for(:controller => "problems", :action => "new").should == "/problems/new"
  end
  
  it "should map { :controller => 'problems', :action => 'show', :id => 1 } to /problems/1" do
    route_for(:controller => "problems", :action => "show", :id => 1).should == "/problems/1"
  end
  
  it "should map { :controller => 'problems', :action => 'edit', :id => 1 } to /problems/1/edit" do
    route_for(:controller => "problems", :action => "edit", :id => 1).should == "/problems/1/edit"
  end
  
  it "should map { :controller => 'problems', :action => 'update', :id => 1} to /problems/1" do
    route_for(:controller => "problems", :action => "update", :id => 1).should == "/problems/1"
  end
  
  it "should map { :controller => 'problems', :action => 'destroy', :id => 1} to /problems/1" do
    route_for(:controller => "problems", :action => "destroy", :id => 1).should == "/problems/1"
  end
  
end

describe ProblemsController, "handling GET /problems" do

  before do
    @problems = mock_model(Problems)
    Problems.stub!(:find).and_return([@problems])
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
  
  it "should find all problems" do
    Problems.should_receive(:find).with(:all).and_return([@problems])
    do_get
  end
  
  it "should assign the found problems for the view" do
    do_get
    assigns[:problems].should == [@problems]
  end
end

describe ProblemsController, "handling GET /problems.xml" do

  before do
    @problems = mock_model(Problems, :to_xml => "XML")
    Problems.stub!(:find).and_return(@problems)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all problems" do
    Problems.should_receive(:find).with(:all).and_return([@problems])
    do_get
  end
  
  it "should render the found problems as xml" do
    @problems.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ProblemsController, "handling GET /problems/1" do

  before do
    @problems = mock_model(Problems)
    Problems.stub!(:find).and_return(@problems)
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
  
  it "should find the problems requested" do
    Problems.should_receive(:find).with("1").and_return(@problems)
    do_get
  end
  
  it "should assign the found problems for the view" do
    do_get
    assigns[:problems].should equal(@problems)
  end
end

describe ProblemsController, "handling GET /problems/1.xml" do

  before do
    @problems = mock_model(Problems, :to_xml => "XML")
    Problems.stub!(:find).and_return(@problems)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the problems requested" do
    Problems.should_receive(:find).with("1").and_return(@problems)
    do_get
  end
  
  it "should render the found problems as xml" do
    @problems.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ProblemsController, "handling GET /problems/new" do

  before do
    @problems = mock_model(Problems)
    Problems.stub!(:new).and_return(@problems)
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
  
  it "should create an new problems" do
    Problems.should_receive(:new).and_return(@problems)
    do_get
  end
  
  it "should not save the new problems" do
    @problems.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new problems for the view" do
    do_get
    assigns[:problems].should equal(@problems)
  end
end

describe ProblemsController, "handling GET /problems/1/edit" do

  before do
    @problems = mock_model(Problems)
    Problems.stub!(:find).and_return(@problems)
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
  
  it "should find the problems requested" do
    Problems.should_receive(:find).and_return(@problems)
    do_get
  end
  
  it "should assign the found problems for the view" do
    do_get
    assigns[:problems].should equal(@problems)
  end
end

describe ProblemsController, "handling POST /problems" do

  before do
    @problems = mock_model(Problems, :to_param => "1")
    Problems.stub!(:new).and_return(@problems)
  end
  
  def post_with_successful_save
    @problems.should_receive(:save).and_return(true)
    post :create, :problems => {}
  end
  
  def post_with_failed_save
    @problems.should_receive(:save).and_return(false)
    post :create, :problems => {}
  end
  
  it "should create a new problems" do
    Problems.should_receive(:new).with({}).and_return(@problems)
    post_with_successful_save
  end

  it "should redirect to the new problems on successful save" do
    post_with_successful_save
    response.should redirect_to(problem_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe ProblemsController, "handling PUT /problems/1" do

  before do
    @problems = mock_model(Problems, :to_param => "1")
    Problems.stub!(:find).and_return(@problems)
  end
  
  def put_with_successful_update
    @problems.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @problems.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the problems requested" do
    Problems.should_receive(:find).with("1").and_return(@problems)
    put_with_successful_update
  end

  it "should update the found problems" do
    put_with_successful_update
    assigns(:problems).should equal(@problems)
  end

  it "should assign the found problems for the view" do
    put_with_successful_update
    assigns(:problems).should equal(@problems)
  end

  it "should redirect to the problems on successful update" do
    put_with_successful_update
    response.should redirect_to(problem_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe ProblemsController, "handling DELETE /problems/1" do

  before do
    @problems = mock_model(Problems, :destroy => true)
    Problems.stub!(:find).and_return(@problems)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the problems requested" do
    Problems.should_receive(:find).with("1").and_return(@problems)
    do_delete
  end
  
  it "should call destroy on the found problems" do
    @problems.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the problems list" do
    do_delete
    response.should redirect_to(problems_url)
  end
end
