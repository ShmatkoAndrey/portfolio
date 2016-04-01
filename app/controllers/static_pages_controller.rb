class StaticPagesController < ApplicationController

  def home
    @files = Kaminari.paginate_array(DropzoneFile.all.reverse.in_groups_of(3)).page(0).per(2)
  end

  def paginate
    @page = params[:page]
    @files = Kaminari.paginate_array(DropzoneFile.all.reverse.in_groups_of(3)).page(@page).per(2)
  end

end
