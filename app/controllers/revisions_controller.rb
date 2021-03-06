class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :revert, :destroy]

  # GET /revisions
  def index
    @revisions = Revision.all
  end

  # GET /revisions/1
  def show
  end

  # POST /revisions/1/revert
  def revert
    page = @revision.page
    new_revision = @revision.dup
    new_revision.version = page.revisions.last.version + 1
    save_revision(new_revision)
  end

  # DELETE /revisions/1
  def destroy
    page = @revision.page
    @revision.destroy
    redirect_to "/pages/#{page.title}/history", notice: 'Revision was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revision_params
      params.require(:revision).permit(:page_id, :version, :contents, :file_path)
    end

    # Saves a revision and its attached page
    def save_revision(revision)
      if revision.save
        revision.page.body = revision.contents
        revision.page.file_path = revision.file_path
        flash[:success] = 'Revision created.'
        redirect_to revision.page and return if revision.page.save
      else
        flash[:danger] = 'Revision failed.'
        redirect_to revision.page
      end
    end
end
