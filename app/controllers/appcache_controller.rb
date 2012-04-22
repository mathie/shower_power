class AppcacheController < ApplicationController
  layout false

  def index
    render status: 404 if Rails.env.development?
  end
end
