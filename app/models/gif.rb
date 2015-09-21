class Gif < ActiveRecord::Base

  belongs_to :user
  acts_as_votable

  attachment :file


  def total
    @gif.get_upvotes.size - @gif.get_downvotes.size
  end

end
