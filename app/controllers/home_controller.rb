class HomeController < ApplicationController
  def index
    @featured_content = Content.free.order(created_at: :desc).limit(3)
    @latest_free_contents = Content.free.order(created_at: :desc).limit(3)
    @sections = Section.order(:order)
  end
end
