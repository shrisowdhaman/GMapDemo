class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :commenter

  validates :body ,:presence=>true,:length=>{:minimum=>5}
  validates :commenter, :presence=>true,:length=>{:minimum=>5}

end
