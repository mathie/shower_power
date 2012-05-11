class PagesController < ApplicationController
  def index
    set_http_caching(:index)
  end

  def about
    set_http_caching(:about)
  end

  protected
  def self.freshness
    if @freshness.blank? || !Rails.env.production?
      @freshness = {}
      [:index, :about].each do |page|
        filename = Rails.root.join('app', 'views', 'pages', "#{page}.html.erb")
        @freshness[page] = {
          last_modified: File.mtime(filename),
          etag: Digest::MD5.hexdigest(File.read(filename))
        }
      end
    end
    @freshness
  end

  def set_http_caching(action)
    freshness = self.class.freshness[action]
    fresh_when last_modified: freshness[:last_modified], etag: freshness[:etag], public: true
    expires_in 10.minutes, public: true
  end
end
