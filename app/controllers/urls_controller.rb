class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @urls = Url.all
  end

  def create
    @url = Url.find_by(url_params)
    
    if @url
      render status: :ok, json: { success: true, original_url: @url.original_url, shortened_url: "#{ROOT_URL}/#{@url.slug}" } 
    else
      @url = Url.new(original_url: url_params[:original_url])
      @url.shorten_url
      if @url.save
        return render status: :ok, json: { success: true, original_url: @url.original_url, shortened_url: "#{ROOT_URL}/#{@url.slug}" }
      end
      render status: :unprocessable_entity, json: { success: false, errors: @url.errors.full_messages }
    end
  end

  def show
    @url = Url.find_by(slug: params[:slug])

    if @url
      render status: :ok, json: { success: true, original_url: @url.original_url }
    else
      render status: :not_found, json: { success: false, message: "URL does not exist" }
    end
  end

  private
    def url_params
      params.require(:url).permit(:original_url)
    end
end
