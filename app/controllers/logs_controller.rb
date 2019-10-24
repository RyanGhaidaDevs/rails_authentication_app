class LogsController < ApplicationController
  def index 
    byebug
    @user = User.find(session["user_id"])
    @user_logs = @user.logs
    render json: {user_logs: @user_logs}
  end 

  def create
    byebug
    @log = Log.create(logs_params)
    render json: {log: @log}
  end 

  def delete
    
  end

  private 
 
  def logs_params 
    params.require(:user).permit(:title, :languages,key_words_bug, :key_words_solution, :solved )
  end 
end
