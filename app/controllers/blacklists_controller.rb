class BlacklistsController < ApplicationController
  include VerificationConcern
  before_action :set_blacklist, only: [:destroy]
  before_action :confirm_admin

  # GET /blacklists
  def index
    @blacklists = Blacklist.all
  end

  # POST /blacklists
  def create
    @blacklist = Blacklist.new(blacklist_params)

    if @blacklist.save
      redirect_to '/blacklists', notice: 'Blacklist entry was successfully created.'
    else
      redirect_to '/blacklists', notice: 'Failed to create blacklist entry'
    end
  end

  # DELETE /blacklists/1
  def destroy
    @blacklist.destroy
    redirect_to blacklists_url, notice: 'Blacklist entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blacklist
      @blacklist = Blacklist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blacklist_params
      params.require(:blacklist).permit(:ip)
    end
end
