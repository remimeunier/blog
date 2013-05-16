class Post < ActiveRecord::Base
  belongs_to :genre
  attr_accessible :content, :title, :created_at, :link, :genre_id
end
