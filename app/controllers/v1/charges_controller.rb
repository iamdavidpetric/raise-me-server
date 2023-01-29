module V1
  class ChargesController < ApiController
    def create
      Stripe::Charge.create(charge_params)
    end

    protected

    def charge_params
      {
        amount: Project.find(params[:id]).fee,
        currency: 'usd',
        customer: current_user.stripe_customer_id || current_user.create_stripe_customer,
        receipt_email: user_email,
        description: 'Raise me!'
      }
    end

    def user_email
      @user_email ||= current_user.email
    end
  end
end
