module V1
  class PaymentController < ApiController
    skip_before_action :authenticate_v1_user!

    def create
      payment_link = Stripe::PaymentLink.create(payment_attrs)
      render json: payment_link
    end

    private

    def payment_params
      params.permit(:id)
    end

    def project
      @project ||= Project.find(payment_params[:id])
    end

    def payment_attrs
      { line_items: [{ price: project.stripe_price_id, quantity: 1 }] }
    end
  end
end
