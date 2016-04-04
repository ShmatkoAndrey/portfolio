class DropzoneFile < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :user

  has_many :votes, dependent: :destroy

  def rate
    self.votes.sum(:like)
  end

end
