class DropzoneFilesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @media = current_user.dropzone_files.new(file: params[:file])
    if @media.save!
      respond_to do |format|
        format.json{ render :json => @media }
      end
    end
  end

  def destroy
    DropzoneFile.find(params[:format]).destroy
  end

end