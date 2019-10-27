class Api::V1::ContentsController < ApplicationController
  def index
    case params[:category]
    when "season"
      @contents = Content.includes(:episodes).all.where(category:params[:category]).order(:created_at)
      respond_to do |format|
        format.json { render json: @contents.as_json(include: :episodes) }
      end
    when "movie"
      @contents = Content.all.where(category:params[:category]).order(:created_at)
      respond_to do |format|
        format.json { render json: @contents }
      end
    else
      @contents = Content.all.order(:created_at)
      respond_to do |format|
        format.json { render json: @contents }
      end
    end
  end
end
