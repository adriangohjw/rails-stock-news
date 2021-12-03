class ApplicationController < ActionController::Base
  def index
    return unless any_index_params_present?
  
    @response = NewsfeedQuery.new(
      symbols: index_params[:symbols],
      search: index_params[:search]
    ).call
  end

  private

  def any_index_params_present?
    return true unless index_params[:symbols].blank?
    return true unless index_params[:search].blank?

    false
  end

  def index_params
    params.permit(:symbols, :search)
  end
end
