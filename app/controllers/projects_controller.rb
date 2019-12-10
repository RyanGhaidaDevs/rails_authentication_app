class ProjectsController < ApplicationController
  include CurrentUserConcern

  def show
    byebug
    session["init"] = true 
    user = User.find(session["user_id"])
    render json: {projects: user.projects}
  end 

  def create
    byebug
    params = project_params
    params[:user_id] = session["user_id"]
    @project = Project.create(params)
    render json: {project: @project}
  end 

  def edit 
    byebug
    @project = Project.find(project_params["id"])
    
    # find user, update his log with params, render json of his logs 
    @project.update(project_params)
    @project.save
    render json: {project: @project}
  end 

  def destroy 
    byebug
   @project = project.find(project_params[:id])
   user_id = @project.user_id
   @project.destroy
   user = User.find(user_id)
   render json: {projects: user.projects}
  end 


  private 
 
  def project_params 
    params.require(:user).permit(:name, :id)
  end 

end
