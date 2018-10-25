class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/1
  def show
  end

  # GET /pages/1/history
  def history
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    @revision = Revision.new
    old = @page.revisions.last
    @version = old.nil? ? 1 : old.version + 1
  end

  # POST /pages
  def create
    @page = Page.new(page_params)
    redirect_to @page, notice: 'Page successfully created' if @page.save
  end

  # PATCH/PUT /pages/1
  def update
    redirect_to @page, notice: 'Page successfully updated' if @page.update(page_params)
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by title: params[:title]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :locked)
    end
end
