class Post < ActiveRecord::Base
  belongs_to :genre
  belongs_to :user
  attr_accessible :content, :title, :created_at, :link, :genre_id, :image, :user_id


 
  has_attached_file :image, :styles => { :thumb => "200x200"}

	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
