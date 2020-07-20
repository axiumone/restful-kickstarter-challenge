class ProjectsController < ApplicationController

    before_action :find

    def index
        @projects = Project.all
    end

    def show
        find
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
        redirect_to project_path(@project)
    end

    def edit
        @project = find
    end

    def update
        # @project = find  #<Project#1232132312: {id:1, name: kickstarter}>
        find.update(project_params)
        redirect_to project_path(find)
    end

    def destroy
        find.destroy
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:name)
    end

    def find
        Project.find(params[:id])
    end
    
end
