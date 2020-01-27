class ProjectsController < ApplicationController
  include CurrentUserConcern

  def show
    # session["init"] = true 
    # user = User.find(session["user_id"])
    params = project_params
    
    user = User.find(params[:user_id])
    @projects = user.projects
    render :json =>  @projects.to_json(include: :logs)
  end 

  def create
    params = project_params
    # params[:user_id] = session["user_id"]
    @project = Project.create(params)
    render json: {project: @project}
  end 

  def edit 
    @project = Project.find(project_params["id"])
    # find user, update his log with params, render json of his logs 
    @project.update(project_params)
    @project.save
    render json: {project: @project}
  end 

  def destroy 
   @project = Project.find(project_params[:id])
   user_id = @project.user_id
   @project.destroy
   user = User.find(user_id)
   @projects = user.projects
   render :json =>  @projects.to_json(include: :logs)
  end 


  private 
 
  def project_params 
    params.require(:user).permit(:name, :id, :user_id)
  end 

end
