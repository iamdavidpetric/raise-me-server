# frozen_string_literal: true

module Webhooks
  class StripeController < ApplicationController
    attr_reader :event

    def payments
      verifiy_signature
      handle_events
    end

    def verifiy_signature
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']

      begin
        @event ||= Stripe::Webhook.construct_event(request.body.read, sig_header, secret_key)
      rescue JSON::ParserError, Stripe::SignatureVerificationError => e
        puts e.message
        head :bad_request
      end
    end

    protected

    def stripe_object
      event&.data&.object
    end

    def handle_events
      return if event.blank?

      case event&.type
      when 'checkout.session.completed'
        handle_payment_successfully
      end
      head :ok
    end

    def handle_payment_successfully
      user_id = stripe_object[:metadata][:user_id]
      project_id = stripe_object[:metadata][:project_id]
      return if user_id.nil? || project_id.nil?

      investor = Investor.new(project_id: project_id, user_id: user_id, ammount: Project.find(project_id).fee)
      investor.save!
    end

    def rails_env
      Rails.env
    end

    def secret_key
      Rails.application.credentials.dig(rails_env.to_sym, :STRIPE_WEBHOOK_KEY) || ENV.fetch('STRIPE_WEBHOOK_KEY', nil)
      'whsec_8156cfd1295f4ea92cb133957f9e8f71f7931c85be9f5a7b439c0edf3af23d3c'
    end
  end
end
