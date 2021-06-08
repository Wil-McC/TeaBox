class Api::V1::SubscriptionsController < ApplicationController
  def create
    sub = Subscription.new(new_sub_params)
    if sub.save
      render json: SubscriptionSerializer.new(sub), status: 201
    else
      error_parse(new_user.errors)
    end
  end

  def get_pricepoint(tea_id, frequency)
    tea = Tea.find(params[:tea_id])
    return (tea.tier * frequency) * 10
  end

  def error_parse(error)
    m = error.messages

    render json: ({ error: m }), status: 400
  end

  private

  def new_sub_params
    data = Hash.new
    data[:customer_id] = params[:user_id]
    data[:tea_id]      = params[:tea_id]
    data[:status]      = 'active'
    data[:frequency]   = params[:frequency].to_i
    data[:pricepoint]  = get_pricepoint(data[:tea_id], data[:frequency])
    return data
  end
end
