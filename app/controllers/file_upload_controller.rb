class FileUploadController < ApplicationController
  def index
    @fileUpload = fileUpload.all
  end

  def new
    @fileUpload = fileUpload.new
  end

  def create
    @fileUpload = fileUpload.new(fileUpload_params)

    if @fileUpload.save
      redirect_to_fileUpload_path, notice: "Successfully uploaded."
    else
      render "new"
    end


  end

  def destroy
    @fileUpload = fileUpload.find(params[:id])
    @fileUpload.destroy
    redirect_to_fileUpload_path, notice: "Successfully deleted."
  end

  private
    def fileUpload_params
    params.require(:fileUpload).permit(:name, :attachment)
  end

end
