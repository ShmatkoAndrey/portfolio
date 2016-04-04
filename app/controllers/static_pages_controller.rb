class StaticPagesController < ApplicationController

  def home
    @files = Kaminari.paginate_array(DropzoneFile.all.reverse.in_groups_of(3)).page(0).per(2)
  end

  def paginate
    @pages = params[:pages]
    @type_page = params[:type_page]
    @pages[@type_page] = params[:page]
  end

end
