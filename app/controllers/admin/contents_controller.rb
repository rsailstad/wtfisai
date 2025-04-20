class Admin::ContentsController < Admin::BaseController
  before_action :set_content, only: [:edit, :update, :destroy]
  before_action :set_section, only: [:new, :create]

  def new
    @content = @section.contents.build
  end

  def create
    @content = @section.contents.build(content_params)
    if @content.save
      redirect_to admin_section_path(@section), notice: 'Content was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to admin_section_path(@content.section), notice: 'Content was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    section = @content.section
    @content.destroy
    redirect_to admin_section_path(section), notice: 'Content was successfully deleted.'
  end

  private

  def set_content
    @content = Content.find_by!(slug: params[:id])
  end

  def set_section
    @section = Section.find(params[:section_id])
  end

  def content_params
    params.require(:content).permit(:title, :body, :content_type, :order, :premium, :video_url)
  end
end 