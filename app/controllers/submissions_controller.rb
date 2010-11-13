class SubmissionsController < ApplicationController
	layout "application"
  # GET /submission
  # GET /submission.xml
  def index
    @submissions = Submission.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submission/1
  # GET /submission/1.xml
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submission/new
  # GET /submission/new.xml
  def new
    @submission = Submission.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submission/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submission
  # POST /submission.xml
  def create
    @submission = Submission.new(params[:submission])

    respond_to do |format|
      if @submission.save
        flash[:notice] = 'Submission was successfully created.'
        format.html { redirect_to(submission_path(@submission)) }
        format.xml  { render :xml => @submission, :status => :created, :location => @submission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /submission/1
  # PUT /submission/1.xml
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        flash[:notice] = 'Submission was successfully updated.'
        format.html { redirect_to(submission_path(@submission)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submission/1
  # DELETE /submission/1.xml
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submission_url) }
      format.xml  { head :ok }
    end
  end
end
