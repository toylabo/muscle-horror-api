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
    @result = Result.new(Result.convert(results_params))
    if @result.save
      @response_code = 200
      @message = "Success!"
    else
      @response_code = 400
      @message = "Bad Request"
    end
    render 'create', formats: :json, handlers: :jbuilder, status: @response_code
  end

  def destroy
    if params[:id]
      begin
        @result = Result.find(params[:id])
        @result.destroy!
        @response_code = 204
        @message = "削除に成功しました"
      rescue ActiveRecord::RecordNotFound
        @response_code = 404
        @message = "存在しないidが指定されました。"
      end
    else
      @response_code = 400
      @message = "idが指定されていません。"
    end
    render json:{responseCode: @response_code, message: @message}, status: @response_code
  end

  private
  def authenticate?
    begin
      @user = User.find_by!(token: request.headers[:token])
    rescue ActiveRecord::RecordNotFound
      return render(json: {responseCode: 401, message: "Unauthorized"}, status: 401)
    end
  end

  def results_params
    params.permit(
        :name,
        :score,
        :life,
        :difficulty,
        analysis:[
            :muscleCount,
            :remainingClearSecond,
            :getKeySecond
        ]
    )
  end
end
