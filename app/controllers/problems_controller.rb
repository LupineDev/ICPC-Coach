class ProblemsController < ApplicationController
  # GET /problem
  # GET /problem.xml
  def index
    @problems = Problem.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @problem }
    end
  end

  # GET /problem/1
  # GET /problem/1.xml
  def show
    @problem = Problem.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @problem }
    end
  end

  # GET /problem/new
  # GET /problem/new.xml
  def new
    @problem = Problem.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @problem }
    end
  end

  # GET /problem/1/edit
  def edit
    @problem = Problem.find(params[:id])
  end

  # POST /problem
  # POST /problem.xml
  def create
    @problem = Problem.new(params[:problem])

    respond_to do |format|
      if @problem.save
        flash[:notice] = 'Problem.was successfully created.'
        format.html { redirect_to(problem_path(@problem)) }
        format.xml  { render :xml => @problem, :status => :created, :location => @problem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /problem/1
  # PUT /problem/1.xml
  def update
    @problem = Problem.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        flash[:notice] = 'Problem.was successfully updated.'
        format.html { redirect_to(problem_path(@problem)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /problem/1
  # DELETE /problem/1.xml
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to(problem_url) }
      format.xml  { head :ok }
    end
  end
end
