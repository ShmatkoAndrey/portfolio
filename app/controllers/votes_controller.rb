class VotesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @type_page = params[:type_page]
    @file = DropzoneFile.find(params[:format])
    @pages = params[:pages]
    current_user.votes.create(like: params[:like], dropzone_file_id: @file.id)
    if @file.votes.where(like: true).length - @file.votes.where(like: false).length <= -5
      @file.destroy
      @destroy = true
    end
  end

end
