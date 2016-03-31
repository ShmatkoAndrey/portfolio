module DropzoneFilesHelper
  def img(file)
    format = file.file_identifier.split('.').last
    %w(jpg jpeg png gif).any? {|f| f == format} ? true : false
  end
end