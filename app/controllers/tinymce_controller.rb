class TinymceController < ApplicationController

  attr_accessor :content

  def create
    @content = params[:content].html_safe
    Message.create(content: @content)
    @messages = Message.all.reverse
      # respond_to do |format|
    #   format.js
    # end
  end

end
