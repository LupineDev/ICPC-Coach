class TeamsController < ApplicationController
	layout "application"
  # GET /team
  # GET /team.xml
  def index
    @teams = Teams.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @team }
    end
  end

  # GET /team/1
  # GET /team/1.xml
  def show
    @team = Teams.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @team }
    end
  end

  # GET /team/new
  # GET /team/new.xml
  def new
    @team = Teams.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @team }
    end
  end

  # GET /team/1/edit
  def edit
    @team = Teams.find(params[:id])
  end

  # POST /team
  # POST /team.xml
  def create
    @team = Teams.new(params[:team])

    respond_to do |format|
      if @team.save
        flash[:notice] = 'Teams was successfully created.'
        format.html { redirect_to(team_path(@team)) }
        format.xml  { render :xml => @team, :status => :created, :location => @team }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /team/1
  # PUT /team/1.xml
  def update
    @team = Teams.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        flash[:notice] = 'Teams was successfully updated.'
        format.html { redirect_to(team_path(@team)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /team/1
  # DELETE /team/1.xml
  def destroy
    @team = Teams.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to(team_url) }
      format.xml  { head :ok }
    end
  end
end
