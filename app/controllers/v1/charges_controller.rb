module V1
  class ChargesController < ApiController
    def create
      Stripe.api_key = 'sk_test_51MH78FHQkKujYS8QCmWkckoO1N4wUoKLeWDyONWlW7As26QJoHfLIXSDcWwACr0P0W0bUkBwRYN9iBa4O2Tm9Btv00tbWbp7T3'

      customer = Stripe::Customer.create(
        email: user_email,
        name: current_user.full_name
      )

      Stripe::Charge.create(charge_params)
    end

    protected

    def charge_params
      {
        amount: Project.find(params[:id]).fee,
        currency: 'usd',
        customer: customer.id,
        receipt_email: email,
        description: 'Raise me!'
      }
    end

    def user_email
      @user_email ||= current_user.email
    end
  end
end
