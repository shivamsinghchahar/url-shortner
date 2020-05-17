class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_url, only: [:update, :show]

  def index
    @urls = Url.order(pinned: :desc, created_at: :desc)
  end

  def create
    @url = Url.find_by(url_params)
    
    if @url
      render status: :ok, json: { url: @url, shortened_url: "#{ROOT_URL}/#{@url.slug}" } 
    else
      @url = Url.new(original_url: url_params[:original_url])
      @url.shorten_url
      if @url.save
        return render status: :ok, json: { url: @url, shortened_url: "#{ROOT_URL}/#{@url.slug}" }
      end
      render status: :unprocessable_entity, json: { errors: @url.errors.full_messages }
    end
  end

  def show
    if @url
      render status: :ok, json: { url: @url }
    else
      render status: :not_found, json: { message: "URL does not exist" }
    end
  end

  def update
    if @url.update(pinned: url_params[:pinned])
      render status: :ok, json: { url: @url, message: "Url Pinned!" }
    else
      render status: :unprocessable_entity, json: { errors: @url.errors.full_messages }
    end
  end

  private
    def url_params
      params.require(:url).permit(:original_url, :pinned)
    end

    def load_url
      @url = Url.find_by(slug: params[:slug])
      unless @url
        render status: :not_found, json: { message: 'Url not found' }
      end
    end
end
