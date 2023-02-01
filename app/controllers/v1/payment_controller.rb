module V1
  class PaymentController < ApiController
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
      {
        metadata: { project_id: project.id, user_id: current_user.id },
        line_items: [{ price: project.stripe_price_id, quantity: 1 }],
        after_completion: { type: 'redirect', redirect: { url: "http://localhost:8080/project/#{project.id}" } }
      }
    end
  end
end
