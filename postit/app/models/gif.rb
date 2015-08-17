class Gif < ActiveRecord::Base

  belongs_to :user

  attachment :file
end
