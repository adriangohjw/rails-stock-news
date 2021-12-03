class ApplicationController < ActionController::Base
  def index
    return if index_params[:search].blank?
  
    @response = NewsfeedQuery.new(
      search: index_params[:search]
    ).call
  end

  private

  def index_params
    params.permit(:search)
  end
end
