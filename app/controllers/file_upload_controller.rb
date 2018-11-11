class FileUploadController < ApplicationController
  def index
    @file_upload = file_upload.all
  end

  def show
    @file_upload = file_upload.find(params[:id])
  end

  def edit
    @file_upload
  end

  def new
    @file_upload = file_upload.new
  end

  def create
    @file_upload = file_upload.new(file_upload_params)

    if @file_upload.save
      redirect_to_file_upload_path, notice: "Successfully uploaded."
    else
      render "new"
    end


  end

  def destroy
    @file_upload = file_upload.find(params[:id])
    @file_upload.destroy
    redirect_to_file_upload_path, notice: "Successfully deleted."
  end

  private
    def ffile_upload_params
    params.require(:file_upload).permit(:name, :attachment)
  end

end
