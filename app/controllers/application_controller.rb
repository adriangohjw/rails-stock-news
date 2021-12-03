class ApplicationController < ActionController::Base
  def index
    return unless any_index_params_present?
  
    @response = NewsfeedQuery.new(
      symbols: index_params[:symbols],
      sentiment: index_params[:sentiment],
      search: index_params[:search]
    ).call
  end

  private

  def any_index_params_present?
    return true unless index_params[:symbols].blank?
    return true unless index_params[:sentiment].blank?
    return true unless index_params[:search].blank?

    false
  end

  def index_params
    params.permit(:symbols, :sentiment, :search)
  end
end
