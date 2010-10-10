class ProblemsController < ApplicationController
  # GET /problems
  # GET /problems.xml
  def index
    @problems = Problems.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.xml
  def show
    @problems = Problems.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @problems }
    end
  end

  # GET /problems/new
  # GET /problems/new.xml
  def new
    @problems = Problems.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @problems }
    end
  end

  # GET /problems/1/edit
  def edit
    @problems = Problems.find(params[:id])
  end

  # POST /problems
  # POST /problems.xml
  def create
    @problems = Problems.new(params[:problems])

    respond_to do |format|
      if @problems.save
        flash[:notice] = 'Problems was successfully created.'
        format.html { redirect_to(problem_path(@problems)) }
        format.xml  { render :xml => @problems, :status => :created, :location => @problems }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @problems.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /problems/1
  # PUT /problems/1.xml
  def update
    @problems = Problems.find(params[:id])

    respond_to do |format|
      if @problems.update_attributes(params[:problems])
        flash[:notice] = 'Problems was successfully updated.'
        format.html { redirect_to(problem_path(@problems)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @problems.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.xml
  def destroy
    @problems = Problems.find(params[:id])
    @problems.destroy

    respond_to do |format|
      format.html { redirect_to(problems_url) }
      format.xml  { head :ok }
    end
  end
end
