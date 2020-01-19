class LogsController < ApplicationController
  include CurrentUserConcern

  def index 
    @logs = Log.all 
    render json: {logs: @logs}
  end 

  def show
    session["init"] = true 
    user = User.find(session["user_id"])
    projectsArray = [] 
    logsArr = []
    projectsArray = user.projects.select{|p| p.logs.size > 0 }
    @logs = projectsArray.map {|p| logsArr.push(p.logs)}
    @logs = @logs.flatten()
    render json: {logs: @logs }
  end 

  def create
    params = logs_params
    @log = Log.create(params)
    render json: {log: @log}
  end 

  def edit 
    @log = Log.find(logs_params["id"])
    
    # find user, update his log with params, render json of his logs 
    @log.update(logs_params)
    @log.save
    render json: {log: @log}
  end 

  def destroy 
    # find project id then delete log
   @log = Log.find(logs_params[:id])
   project_id = @log.project_id
   @log.destroy
   @project = Project.find(project_id)
   render json: {logs: @project.logs}
  end 


  private 
 
  def logs_params 
    params.require(:user).permit(:bugTitle, :bugDescription, :languagesInvolved, :links, :solution, :notes, :id, :log, :project_id, :user_id)
  end 
end
