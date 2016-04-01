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
    @file = DropzoneFile.find(params[:format]).destroy
    @page = params[:page]
  end

end