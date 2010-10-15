class MembersController < ApplicationController
  # GET /members
  # GET /members.xml
  def index
    @members = Member.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @members = Member.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @members = Member.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1/edit
  def edit
    @members = Member.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @members = Member.new(params[:members])

    respond_to do |format|
      if @members.save
        flash[:notice] = 'Member was successfully created.'
        format.html { redirect_to(member_path(@members)) }
        format.xml  { render :xml => @members, :status => :created, :location => @members }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @members.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @members = Member.find(params[:id])

    respond_to do |format|
      if @members.update_attributes(params[:members])
        flash[:notice] = 'Member was successfully updated.'
        format.html { redirect_to(member_path(@members)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @members.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @members = Member.find(params[:id])
    @members.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
end
