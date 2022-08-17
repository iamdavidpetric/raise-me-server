class ApiController < UnauthenticatedApiController
    before_action :authenticate_v1_user!

    protected
  
    def current_user
      @current_user = current_v1_user
    end

end