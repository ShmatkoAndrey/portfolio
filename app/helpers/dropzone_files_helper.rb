module DropzoneFilesHelper
  def img(file)
    format = file.file_identifier.split('.').last
    %w(jpg jpeg png gif).any? {|f| f == format} ? true : false
  end

  def votes_cnt(media)
    media.votes.where(like: true).length - media.votes.where(like: false).length
  end

  def user_vote?(id)
    current_user.votes.where(dropzone_file_id: id).any?
  end

  def files_kaminari(page = 0)
    Kaminari.paginate_array(DropzoneFile.all.reverse.in_groups_of(3)).page(page).per(2)
  end

end