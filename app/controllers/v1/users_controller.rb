module V1
	class UsersController < ApiController
		before_action :find_user, only: [:show, :update, :destroy]
	
		def index
			 users = User.all
			render json:users
		end 

		def show
		render json:@user
		end

		def create
		user = User.new(user_params)
		user.save!
		render json:user
		end

		def update
		@user.update(user_params)
		render json:@user
		end

		
		def destroy
		@user.delete
		render json:@user
		end

		protected

		def user_params
		params.permit(:first_name, :last_name, :email, :username)
		end

		def find_user
		@user||=User.find(params[:id])
		end

	end 


end