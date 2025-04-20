class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: [:show, :cancel]

  def new
    @subscription = current_user.build_subscription
  end

  def create
    # This would integrate with Stripe in a real implementation
    @subscription = current_user.build_subscription(subscription_params)
    @subscription.status = 'active'
    @subscription.start_date = Time.current
    @subscription.end_date = 1.year.from_now

    if @subscription.save
      redirect_to root_path, notice: "Subscription created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def cancel
    if @subscription.update(status: 'cancelled')
      redirect_to root_path, notice: "Subscription cancelled successfully."
    else
      redirect_to subscription_path, alert: "Could not cancel subscription."
    end
  end

  private

  def set_subscription
    @subscription = current_user.subscription
  end

  def subscription_params
    params.require(:subscription).permit(:plan_type)
  end
end 