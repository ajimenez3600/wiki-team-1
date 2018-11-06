class PagesController < ApplicationController
  before_action :set_page, only: [:show, :history, :edit, :update, :destroy]

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/1
  def show
    redirect_to '/404' if @page.nil?
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
    if @page.save
      flash[:success] = "Page was successfully created." 
    end
    redirect_to @page 
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      flash[:success] = "Page was successfully updated." 
    end
    redirect_to @page 
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    flash[:success] = "Page was successfully destroyed."
    redirect_to pages_url 
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
