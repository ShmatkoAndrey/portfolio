class VotesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @file = DropzoneFile.find(params[:format])
    @page = params[:page]
    current_user.votes.create(like: params[:like], dropzone_file_id: @file.id)
    if @file.votes.where(like: true).length - @file.votes.where(like: false).length <= -5
      @file.destroy
      @destroy = true
    end
  end

end
