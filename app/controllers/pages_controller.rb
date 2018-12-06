class PagesController < ApplicationController
  before_action :set_page, only: [:show, :history, :edit, :update, :destroy]

  # GET /pages
  def index
    if params[:title] then
      @pages = Page.where("title like ?", "%#{params[:title]}%")
    else
      @pages = Page.all
    end
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
  end

  # POST /pages
  def create
    @page = Page.new(page_params)
    if @page.save and new_revision
      flash[:success] = "Page was successfully created."
      redirect_to @page
    else
      flash[:danger] = "Failed to create page."
      render 'new'
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params) and new_revision
      flash[:success] = "Page was successfully updated."
      redirect_to @page
    else
      flash[:danger] = "Failed to update page."
      render 'edit'
    end
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

    def new_revision
      revision = Revision.new
      revision.page = @page
      revision.title = @page.title
      revision.contents = @page.body
      revision.version = @page.revisions.count + 1
      revision.save
    end
end
