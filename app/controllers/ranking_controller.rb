class RankingController < ApplicationController

  def index
    per_page = params[:per_page]&.to_i || 5
    @page = params[:page]&.to_i || 1
    (params[:order]&.downcase == 'asc') ? order = "ASC" : order = "DESC"
    @results = Result.page(@page).per(per_page).order("score " + order)
    @response_code = 200
    @message = "Success!"
    render 'results/index', formats: :json, handlers: :jbuilder, status: @response_code
  end

end
