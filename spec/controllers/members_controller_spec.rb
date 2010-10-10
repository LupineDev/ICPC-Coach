require File.dirname(__FILE__) + '/../spec_helper'

describe MembersController, "#route_for" do

  it "should map { :controller => 'members', :action => 'index' } to /members" do
    route_for(:controller => "members", :action => "index").should == "/members"
  end
  
  it "should map { :controller => 'members', :action => 'new' } to /members/new" do
    route_for(:controller => "members", :action => "new").should == "/members/new"
  end
  
  it "should map { :controller => 'members', :action => 'show', :id => 1 } to /members/1" do
    route_for(:controller => "members", :action => "show", :id => 1).should == "/members/1"
  end
  
  it "should map { :controller => 'members', :action => 'edit', :id => 1 } to /members/1/edit" do
    route_for(:controller => "members", :action => "edit", :id => 1).should == "/members/1/edit"
  end
  
  it "should map { :controller => 'members', :action => 'update', :id => 1} to /members/1" do
    route_for(:controller => "members", :action => "update", :id => 1).should == "/members/1"
  end
  
  it "should map { :controller => 'members', :action => 'destroy', :id => 1} to /members/1" do
    route_for(:controller => "members", :action => "destroy", :id => 1).should == "/members/1"
  end
  
end

describe MembersController, "handling GET /members" do

  before do
    @members = mock_model(Members)
    Members.stub!(:find).and_return([@members])
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
  
  it "should find all members" do
    Members.should_receive(:find).with(:all).and_return([@members])
    do_get
  end
  
  it "should assign the found members for the view" do
    do_get
    assigns[:members].should == [@members]
  end
end

describe MembersController, "handling GET /members.xml" do

  before do
    @members = mock_model(Members, :to_xml => "XML")
    Members.stub!(:find).and_return(@members)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all members" do
    Members.should_receive(:find).with(:all).and_return([@members])
    do_get
  end
  
  it "should render the found members as xml" do
    @members.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MembersController, "handling GET /members/1" do

  before do
    @members = mock_model(Members)
    Members.stub!(:find).and_return(@members)
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
  
  it "should find the members requested" do
    Members.should_receive(:find).with("1").and_return(@members)
    do_get
  end
  
  it "should assign the found members for the view" do
    do_get
    assigns[:members].should equal(@members)
  end
end

describe MembersController, "handling GET /members/1.xml" do

  before do
    @members = mock_model(Members, :to_xml => "XML")
    Members.stub!(:find).and_return(@members)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the members requested" do
    Members.should_receive(:find).with("1").and_return(@members)
    do_get
  end
  
  it "should render the found members as xml" do
    @members.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MembersController, "handling GET /members/new" do

  before do
    @members = mock_model(Members)
    Members.stub!(:new).and_return(@members)
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
  
  it "should create an new members" do
    Members.should_receive(:new).and_return(@members)
    do_get
  end
  
  it "should not save the new members" do
    @members.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new members for the view" do
    do_get
    assigns[:members].should equal(@members)
  end
end

describe MembersController, "handling GET /members/1/edit" do

  before do
    @members = mock_model(Members)
    Members.stub!(:find).and_return(@members)
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
  
  it "should find the members requested" do
    Members.should_receive(:find).and_return(@members)
    do_get
  end
  
  it "should assign the found members for the view" do
    do_get
    assigns[:members].should equal(@members)
  end
end

describe MembersController, "handling POST /members" do

  before do
    @members = mock_model(Members, :to_param => "1")
    Members.stub!(:new).and_return(@members)
  end
  
  def post_with_successful_save
    @members.should_receive(:save).and_return(true)
    post :create, :members => {}
  end
  
  def post_with_failed_save
    @members.should_receive(:save).and_return(false)
    post :create, :members => {}
  end
  
  it "should create a new members" do
    Members.should_receive(:new).with({}).and_return(@members)
    post_with_successful_save
  end

  it "should redirect to the new members on successful save" do
    post_with_successful_save
    response.should redirect_to(member_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe MembersController, "handling PUT /members/1" do

  before do
    @members = mock_model(Members, :to_param => "1")
    Members.stub!(:find).and_return(@members)
  end
  
  def put_with_successful_update
    @members.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @members.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the members requested" do
    Members.should_receive(:find).with("1").and_return(@members)
    put_with_successful_update
  end

  it "should update the found members" do
    put_with_successful_update
    assigns(:members).should equal(@members)
  end

  it "should assign the found members for the view" do
    put_with_successful_update
    assigns(:members).should equal(@members)
  end

  it "should redirect to the members on successful update" do
    put_with_successful_update
    response.should redirect_to(member_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe MembersController, "handling DELETE /members/1" do

  before do
    @members = mock_model(Members, :destroy => true)
    Members.stub!(:find).and_return(@members)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the members requested" do
    Members.should_receive(:find).with("1").and_return(@members)
    do_delete
  end
  
  it "should call destroy on the found members" do
    @members.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the members list" do
    do_delete
    response.should redirect_to(members_url)
  end
end
