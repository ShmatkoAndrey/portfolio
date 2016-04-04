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

  def files_kaminari(page = 0, tab)
    case tab
      when 'new'
        Kaminari.paginate_array(DropzoneFile.order('created_at DESC').in_groups_of(3)).page(page).per(2)
      when 'top'
        hash = Hash.new
        DropzoneFile.all.each do |d|
          vt = d.votes
          hash[d] = vt.where(like: true).length - vt.where(like: false).length
        end
        Kaminari.paginate_array(hash.sort_by {|_key, value| value}.to_h.keys.reverse.in_groups_of(3)).page(page).per(2)
      when 'myfiles'
        Kaminari.paginate_array(current_user.dropzone_files.order('created_at DESC').in_groups_of(3)).page(page).per(2)
      else
        puts 'und tab'.red
    end
  end

end