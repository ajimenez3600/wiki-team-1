class PagesController < ApplicationController
  include VerificationConcern
  before_action :set_page, only: [:show, :lock, :unlock, :history, :edit, :update, :destroy]
  before_action :confirm_authenticated, only: [:new, :create, :edit, :update]
  before_action :confirm_admin, only: [:lock, :unlock, :delete]

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

  def lock
    @page.locked = true
    if @page.save
      redirect_to @page
    else
      render 'show'
    end
  end

  def unlock
    @page.locked = false
    if @page.save
      redirect_to @page
    else
      render 'show'
    end
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
    @page = Page.create! page_params
    if attach_blob and new_revision
      flash[:success] = "Page was successfully created."
      redirect_to @page
    else
      @page.destroy
      flash[:danger] = "Failed to create page."
      render 'new'
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params) and attach_blob and new_revision
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
      params.require(:page).permit(:title, :body)
    end

    def attach_blob
      if params[:page][:images]
        @page.images.attach(params[:page][:images])
        return @page.images.attached?
      else
        return true
      end
    end

    def new_revision
      revision = Revision.create(:page => @page, :title => @page.title, :contents => @page.body, :version => @page.revisions.count + 1, :user => current_user)
      revision.images.attach(@page.images.map{|image|image.blob})
    end
end
