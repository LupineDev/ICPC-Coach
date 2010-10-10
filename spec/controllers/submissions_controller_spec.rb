require File.dirname(__FILE__) + '/../spec_helper'

describe SubmissionsController, "#route_for" do

  it "should map { :controller => 'submissions', :action => 'index' } to /submissions" do
    route_for(:controller => "submissions", :action => "index").should == "/submissions"
  end
  
  it "should map { :controller => 'submissions', :action => 'new' } to /submissions/new" do
    route_for(:controller => "submissions", :action => "new").should == "/submissions/new"
  end
  
  it "should map { :controller => 'submissions', :action => 'show', :id => 1 } to /submissions/1" do
    route_for(:controller => "submissions", :action => "show", :id => 1).should == "/submissions/1"
  end
  
  it "should map { :controller => 'submissions', :action => 'edit', :id => 1 } to /submissions/1/edit" do
    route_for(:controller => "submissions", :action => "edit", :id => 1).should == "/submissions/1/edit"
  end
  
  it "should map { :controller => 'submissions', :action => 'update', :id => 1} to /submissions/1" do
    route_for(:controller => "submissions", :action => "update", :id => 1).should == "/submissions/1"
  end
  
  it "should map { :controller => 'submissions', :action => 'destroy', :id => 1} to /submissions/1" do
    route_for(:controller => "submissions", :action => "destroy", :id => 1).should == "/submissions/1"
  end
  
end

describe SubmissionsController, "handling GET /submissions" do

  before do
    @submissions = mock_model(Submissions)
    Submissions.stub!(:find).and_return([@submissions])
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
  
  it "should find all submissions" do
    Submissions.should_receive(:find).with(:all).and_return([@submissions])
    do_get
  end
  
  it "should assign the found submissions for the view" do
    do_get
    assigns[:submissions].should == [@submissions]
  end
end

describe SubmissionsController, "handling GET /submissions.xml" do

  before do
    @submissions = mock_model(Submissions, :to_xml => "XML")
    Submissions.stub!(:find).and_return(@submissions)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all submissions" do
    Submissions.should_receive(:find).with(:all).and_return([@submissions])
    do_get
  end
  
  it "should render the found submissions as xml" do
    @submissions.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe SubmissionsController, "handling GET /submissions/1" do

  before do
    @submissions = mock_model(Submissions)
    Submissions.stub!(:find).and_return(@submissions)
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
  
  it "should find the submissions requested" do
    Submissions.should_receive(:find).with("1").and_return(@submissions)
    do_get
  end
  
  it "should assign the found submissions for the view" do
    do_get
    assigns[:submissions].should equal(@submissions)
  end
end

describe SubmissionsController, "handling GET /submissions/1.xml" do

  before do
    @submissions = mock_model(Submissions, :to_xml => "XML")
    Submissions.stub!(:find).and_return(@submissions)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the submissions requested" do
    Submissions.should_receive(:find).with("1").and_return(@submissions)
    do_get
  end
  
  it "should render the found submissions as xml" do
    @submissions.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe SubmissionsController, "handling GET /submissions/new" do

  before do
    @submissions = mock_model(Submissions)
    Submissions.stub!(:new).and_return(@submissions)
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
  
  it "should create an new submissions" do
    Submissions.should_receive(:new).and_return(@submissions)
    do_get
  end
  
  it "should not save the new submissions" do
    @submissions.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new submissions for the view" do
    do_get
    assigns[:submissions].should equal(@submissions)
  end
end

describe SubmissionsController, "handling GET /submissions/1/edit" do

  before do
    @submissions = mock_model(Submissions)
    Submissions.stub!(:find).and_return(@submissions)
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
  
  it "should find the submissions requested" do
    Submissions.should_receive(:find).and_return(@submissions)
    do_get
  end
  
  it "should assign the found submissions for the view" do
    do_get
    assigns[:submissions].should equal(@submissions)
  end
end

describe SubmissionsController, "handling POST /submissions" do

  before do
    @submissions = mock_model(Submissions, :to_param => "1")
    Submissions.stub!(:new).and_return(@submissions)
  end
  
  def post_with_successful_save
    @submissions.should_receive(:save).and_return(true)
    post :create, :submissions => {}
  end
  
  def post_with_failed_save
    @submissions.should_receive(:save).and_return(false)
    post :create, :submissions => {}
  end
  
  it "should create a new submissions" do
    Submissions.should_receive(:new).with({}).and_return(@submissions)
    post_with_successful_save
  end

  it "should redirect to the new submissions on successful save" do
    post_with_successful_save
    response.should redirect_to(submission_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe SubmissionsController, "handling PUT /submissions/1" do

  before do
    @submissions = mock_model(Submissions, :to_param => "1")
    Submissions.stub!(:find).and_return(@submissions)
  end
  
  def put_with_successful_update
    @submissions.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @submissions.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the submissions requested" do
    Submissions.should_receive(:find).with("1").and_return(@submissions)
    put_with_successful_update
  end

  it "should update the found submissions" do
    put_with_successful_update
    assigns(:submissions).should equal(@submissions)
  end

  it "should assign the found submissions for the view" do
    put_with_successful_update
    assigns(:submissions).should equal(@submissions)
  end

  it "should redirect to the submissions on successful update" do
    put_with_successful_update
    response.should redirect_to(submission_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe SubmissionsController, "handling DELETE /submissions/1" do

  before do
    @submissions = mock_model(Submissions, :destroy => true)
    Submissions.stub!(:find).and_return(@submissions)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the submissions requested" do
    Submissions.should_receive(:find).with("1").and_return(@submissions)
    do_delete
  end
  
  it "should call destroy on the found submissions" do
    @submissions.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the submissions list" do
    do_delete
    response.should redirect_to(submissions_url)
  end
end
