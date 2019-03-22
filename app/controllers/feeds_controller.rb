class FeedsController < BaseController
  # callbacks
  before_action :set_feed, only: [:show]

  # GET /feeds
  def index
    _, feeds = pagy Feed.all 

    json_response_with_serializer(feeds, Serializer::FEED)
  end

  # GET /feeds/:id
  def show
    json_response_with_serializer(@feed, Serializer::FEED)
  end

  # POST /feeds
  def create
    @feed = Feed.add(url: feed_params[:url])
    json_response_with_serializer(@feed, Serializer::FEED)
  end

  private

  def feed_params
    params.permit(:url)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
