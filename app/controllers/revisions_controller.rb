class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :destroy]

  # GET /revisions
  def index
    @revisions = Revision.all
  end

  # GET /revisions/1
  def show
  end

  # POST /revisions
  def create
    @revision = Revision.new(revision_params)
    if @revision.save
      @revision.page.body = @revision.contents
      redirect_to @revision.page, notice: 'Revision Created' if @revision.page.save
    else
      redirect_to @revision.page, notice: 'Revision Failed'
    end
  end

  # DELETE /revisions/1
  def destroy
    @revision.destroy
    redirect_to revisions_url, notice: 'Revision was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revision_params
      params.require(:revision).permit(:page_id, :version, :contents)
    end
end
