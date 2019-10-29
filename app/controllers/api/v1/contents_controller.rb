class Api::V1::ContentsController < ApplicationController
  def index
    case params[:category]
    when "season"
      @contents = Content.includes(:episodes).all.where(category:params[:category]).order(:created_at).as_json(include: :episodes)
    when "movie"
      @contents = Content.all.where(category:params[:category]).order(:created_at)
    else
      @contents = Content.all.order(:created_at)
    end
    render json: @contents
  end
end
