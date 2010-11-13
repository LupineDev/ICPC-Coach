class ProblemSetsController < ApplicationController
	layout "application"
  # GET /problem_set
  # GET /problem_set.xml
  def index
    @problem_sets = ProblemSet.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @problem_sets }
    end
  end

  # GET /problem_set/1
  # GET /problem_set/1.xml
  def show
    @problem_set = ProblemSet.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @problem_set }
    end
  end

  # GET /problem_set/new
  # GET /problem_set/new.xml
  def new
    @problem_set = ProblemSet.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @problem_set }
    end
  end

  # GET /problem_set/1/edit
  def edit
    @problem_set = ProblemSet.find(params[:id])
  end

  # POST /problem_set
  # POST /problem_set.xml
  def create
    @problem_set = ProblemSet.new(params[:problem_set])

    respond_to do |format|
      if @problem_set.save
        flash[:notice] = 'ProblemSet was successfully created.'
        format.html { redirect_to(problem_set_path(@problem_set)) }
        format.xml  { render :xml => @problem_set, :status => :created, :location => @problem_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @problem_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /problem_set/1
  # PUT /problem_set/1.xml
  def update
    @problem_set = ProblemSet.find(params[:id])

    respond_to do |format|
      if @problem_set.update_attributes(params[:problem_set])
        flash[:notice] = 'ProblemSet was successfully updated.'
        format.html { redirect_to(problem_set_path(@problem_set)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @problem_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_set/1
  # DELETE /problem_set/1.xml
  def destroy
    @problem_set = ProblemSet.find(params[:id])
    @problem_set.destroy

    respond_to do |format|
      format.html { redirect_to(problem_sets_url) }
      format.xml  { head :ok }
    end
  end
end
