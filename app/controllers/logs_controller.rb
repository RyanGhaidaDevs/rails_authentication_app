class LogsController < ApplicationController
  include CurrentUserConcern

  # def index 
  #   if @current_user 
  #     render json: {
  #       logs: @current_user.logs
  #     }
  #   else 
      
  #     x = User.last
  #     render json: {
  #       logs: x.logs
  #     }
  #   end 
  # end 

  def show
    session["init"] = true 
    user = User.find(session["user_id"])
    render json: {logs: user.logs}
  end 

  def create
    params = logs_params
    params[:user_id] = session["user_id"]
    @log = Log.create(params)
    render json: {log: @log}
  end 

  def edit 
    @log = Log.find(logs_params["id"])
    byebug
    # find user, update his log with params, render json of his logs 
    # @log.update(logs_params)

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
    params.require(:user).permit(:bugTitle, :bugDescription, :languagesInvolved, :links, :solution,:notes, :user_id, :id, :log )
  end 
end
