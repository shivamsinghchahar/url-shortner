class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_url, only: [:update, :decode]
  before_action :increment, only: :decode

  def index
    render
  end

  def encode
    @url = Url.find_or_initialize_by(url_params)
    
    unless @url.new_record?
      render status: :ok, json: { url: @url, shortened_url: "#{ROOT_URL}/#{@url.slug}" } 
    else
      @url.shorten_url
      if @url.save
        return render status: :ok, json: { url: @url, shortened_url: "#{ROOT_URL}/#{@url.slug}" }
      end
      render status: :unprocessable_entity, json: { errors: @url.errors.full_messages }
    end
  end

  def decode
    if @url
      render status: :ok, json: { url: @url }
    else
      render status: :not_found, json: { message: "URL does not exist" }
    end
  end

  def update
    if @url.toggle(:pinned).save
      render status: :ok, json: { url: @url, message: "Url Pinned!" }
    else
      render status: :unprocessable_entity, json: { errors: @url.errors.full_messages }
    end
  end

  private
    def url_params
      params.require(:url).permit(:original)
    end

    def load_url
      @url = Url.find_by(slug: params[:slug])
      unless @url
        render status: :not_found, json: { errors: ['Url not found'] }
      end
    end

    def increment
      @url.increment!(:clicks)
    end
end
