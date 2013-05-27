class Post < ActiveRecord::Base
  belongs_to :genre
  attr_accessible :content, :title, :created_at, :link, :genre_id, :image


  	# voir la gem papercast avec imagemagic pour le redimmensionnement
  has_attached_file :image, :styles => { :thumb => "300x300"}

	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
