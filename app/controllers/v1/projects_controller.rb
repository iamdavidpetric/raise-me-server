module V1
	class ProjectsController < ApiController
		before_action :find_project, only:[:show, :update, :destroy]

		def index 
			category_params = params[:category]
			category_search = params[:search]
			projects = Project.by_search(category_search).by_category(category_params)
			render json: projects
		end

		def show
			render json: @project
		end

		def update 
			@project.update(project_params)
			render json: @project
		end

		def create
			project = Project.new(project_params)
			project.save!
			render json: project
		end

		def destroy
			@project.destroy
			render json: @project
		end
		

		def project_params
		params.permit(:user_id, :goal, :deadline, :name, :category, :description, :team_members, :fee, :statement, :images)
		end

		def find_project
			@project ||= Project.find(params[:id])
		end

	end
end
