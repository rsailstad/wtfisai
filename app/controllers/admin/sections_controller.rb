class Admin::SectionsController < Admin::BaseController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  def index
    @sections = Section.all.order(:order)
  end

  def show
    @contents = @section.contents.order(:order)
  end

  def new
    @section = Section.new
  end

  def edit
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to admin_section_path(@section), notice: 'Section was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @section.update(section_params)
      redirect_to admin_section_path(@section), notice: 'Section was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    redirect_to admin_sections_path, notice: 'Section was successfully deleted.'
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :description, :order)
  end
end 