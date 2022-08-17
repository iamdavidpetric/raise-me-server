module V1
	class InvestorsController < ApiController
		skip_before_action :authenticate_v1_user!, only:[:index, :show]
		
		before_action :find_investor, only:[:show, :update, :destroy]

		def index
			investor = Investor.all
			render json: investor
		end

		def show
			render json: @investor
		end

		def update 
			@investor.update(investor_params)
			render json: @investor
		end

		def create
			investor= Investor.new(investor_params)
			investor.save!	
			render json: investor
		end

		def destroy
			@investor.delete    
			render json: @investor
		end

		def investor_params
			params.permit(:user_id, :project_id, :ammount)
		end

		def find_investor
			@investor ||=Investor.find(params[:id])
		end
	end 
end