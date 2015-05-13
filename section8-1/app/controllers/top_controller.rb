class TopController < ApplicationController
  def index
    @articles = Article.open.order(released_at: :desc).limit(5)
  end

  def about
  end
end
