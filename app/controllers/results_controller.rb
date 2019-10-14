class ResultsController < ApplicationController
  before_action :authenticate?, only:[:create, :destroy]

  def index
    per_page = params[:per_page]&.to_i || 5
    @page = params[:page]&.to_i || 1
    (params[:order]&.downcase == 'asc') ? order = "ASC" : order = "DESC"
    @results = Result.page(@page).per(per_page).order("created_at " + order)
    @response_code = 200
    @message = "Success!"
    render 'index', formats: :json, handlers: :jbuilder, status: @response_code
  end

  def show
    if params[:id]
      begin
        @result = Result.find(params[:id])
        @response_code = 200
        @message = "Success!"
      rescue RecordNotFound
        @response_code = 404
        @message = "存在しないidが指定されました。"
      end
    else
      @response_code = 400
      @message = "idが指定されていません。"
    end
    render 'show', formats: :json, handlers: :jbuilder, status: @response_code
  end

  def create

  end

  def destroy

  end

  private
  def authenticate?
  end
end
