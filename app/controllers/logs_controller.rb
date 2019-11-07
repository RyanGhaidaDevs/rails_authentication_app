class LogsController < ApplicationController
  def index 
    byebug
    @user = User.find(session["user_id"])
    @user_logs = @user.logs
    render json: {user_logs: @user_logs}
  end 

  def create
    params = logs_params
    params[:user_id] = session["user_id"]
    byebug
    @log = Log.create(params)
    render json: {log: @log}
  end 

  def delete
    
  end

  private 
 
  def logs_params 
    params.require(:user).permit(:bugTitle, :bugDescription, :languagesInvolved, :links, :solution,:notes, :user_id )
  end 
end
