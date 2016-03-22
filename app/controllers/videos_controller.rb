class VideosController < ApplicationController

  def create
    @video = Video.create(video_params)
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end

end
