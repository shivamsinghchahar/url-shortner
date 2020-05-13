class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @url = Url.find_by(original_url: url_params[:original_url])
    
    if @url
      render status: :ok, json: { original_url: @url.original_url, shortened_url: @url.shortened_url } 
    else
      @url = Url.new(original_url: url_params[:original_url])
      @url.shorten_url
      if @url.save
        return render status: :ok, json: { original_url: @url.original_url, shortened_url: @url.shortened_url }
      end
      render status: :unprocessable_entity, json: { errors: @url.errors.full_messages }
    end
  end

  def show
    @url = Url.find_by(shortened_url: "#{ROOT_URL}/#{params[:shortened_url]}")

    return redirect_to @url.original_url if @url
    render status: :not_found, json: { message: "URL does not exist" }
  end

  private
    def url_params
      params.require(:url).permit(:original_url, :shortened_url)
    end
end
