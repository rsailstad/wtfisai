class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_section, only: [:show]

  def index
    @sections = Section.order(:order)
  end

  def show
    @contents = @section.contents.order(:order)
    unless current_user.has_active_subscription?
      @contents = @contents.free
    end
  end

  private

  def set_section
    @section = Section.find_by!(slug: params[:id])
  end
end 