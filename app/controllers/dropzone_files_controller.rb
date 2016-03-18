class DropzoneFilesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @media = DropzoneFile.new(file: params[:file])
    if @media.save!
      respond_to do |format|
        format.json{ render :json => @media }
      end
    end
  end

  # def delete_media
  #   Media.where(id: params[:media_contents]).destroy_all
  #   redirect_to root_url
  # end

end
