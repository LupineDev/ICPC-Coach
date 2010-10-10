class SubmissionsController < ApplicationController
  # GET /submissions
  # GET /submissions.xml
  def index
    @submissions = Submissions.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.xml
  def show
    @submissions = Submissions.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @submissions }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.xml
  def new
    @submissions = Submissions.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @submissions }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submissions = Submissions.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.xml
  def create
    @submissions = Submissions.new(params[:submissions])

    respond_to do |format|
      if @submissions.save
        flash[:notice] = 'Submissions was successfully created.'
        format.html { redirect_to(submission_path(@submissions)) }
        format.xml  { render :xml => @submissions, :status => :created, :location => @submissions }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @submissions.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.xml
  def update
    @submissions = Submissions.find(params[:id])

    respond_to do |format|
      if @submissions.update_attributes(params[:submissions])
        flash[:notice] = 'Submissions was successfully updated.'
        format.html { redirect_to(submission_path(@submissions)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submissions.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.xml
  def destroy
    @submissions = Submissions.find(params[:id])
    @submissions.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.xml  { head :ok }
    end
  end
end
