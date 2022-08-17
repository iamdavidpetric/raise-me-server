module V1
	class ProjectsController < ApiController
    skip_before_action :authenticate_v1_user!, only:[:index, :show]

		before_action :find_project, only:[:show, :update, :destroy]

		def index 
			category_params = params[:category]
			search_params = params[:search]
			projects = Project.by_search(search_params).by_category(category_params)
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
		params.permit(:user_id, :goal, :deadline, :name, :category, :description, :fee, :statement, images:[], team_members_attributes: %i[name avatar_url] ).to_h
		end

		def find_project
			@project ||= Project.find(params[:id])
		end

		def my_projects
			userproject = current_user.projects
			render json:userproject
		end
	end
end
