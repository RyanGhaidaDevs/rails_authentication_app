class LogsController < ApplicationController
  include CurrentUserConcern

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
    byebug
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
   @log = Log.find(logs_params[:id])
   user_id = @log.user_id
   @log.destroy
   user = User.find(user_id)
   render json: {logs: user.logs}
  end 


  private 
 
  def logs_params 
    params.require(:user).permit(:bugTitle, :bugDescription, :languagesInvolved, :links, :solution, :notes, :id, :log, :project_id )
  end 
end
