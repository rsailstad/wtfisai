class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:show]

  def show
    if @content.premium? && !current_user.has_active_subscription?
      redirect_to subscription_path, alert: "This content requires a premium subscription."
      return
    end

    @content_progress = current_user.content_progresses.find_or_initialize_by(content: @content)
    @content_progress.status = 'started'
    @content_progress.save
  end

  def complete
    @content = Content.find(params[:id])
    @content_progress = current_user.content_progresses.find_by(content: @content)
    
    if @content_progress
      @content_progress.update(status: 'completed', completed_at: Time.current)
      redirect_to section_path(@content.section), notice: "Content marked as completed!"
    else
      redirect_to section_path(@content.section), alert: "Could not mark content as completed."
    end
  end

  private

  def set_content
    @content = Content.find_by!(slug: params[:id])
  end
end 