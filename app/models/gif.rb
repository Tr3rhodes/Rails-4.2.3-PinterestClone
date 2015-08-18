class Gif < ActiveRecord::Base

  belongs_to :user

  attachment :file, content_type: "image/gif", extension: "gif"
end
