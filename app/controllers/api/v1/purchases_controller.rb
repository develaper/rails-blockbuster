class Api::V1::PurchasesController < ApplicationController
  before_action :get_user, only: [:index, :create]

  def index
    @purchases = @user.library.as_json(include: :content)
    render json: @purchases, status: :ok
  end

  def create
    @purchase = @user.purchases.build(purchase_params)
    if catch(:abort) { @purchase.save }
      render json: @purchase, status: :ok
    else
      render json: "something went wrong", status: '422'
    end
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end
  def purchase_params
    params.permit(:price, :quality, :content_id, :user_id)
  end
end
