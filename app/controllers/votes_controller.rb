class VotesController < ApplicationController

  def create
    @file = DropzoneFile.find(params[:format])
    current_user.votes.create(like: params[:like], dropzone_file_id: @file.id)
    if @file.votes.where(like: true).length - @file.votes.where(like: false).length <= -5
      @file.destroy
      @destroy = true
    end

  end

end
