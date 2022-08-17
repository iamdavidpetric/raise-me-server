module V1
  class SessionsController < ApiController

    def create
      # user = User.where(email: params[:email]).first
      # if user.valid_password?(params[:password])
      #   render json: user.as_json(only: [:id, :email]), status: created
      # else 
      #   head(:unauthiruzed)
      # end
    end

    def destroy
    end

  end 
end