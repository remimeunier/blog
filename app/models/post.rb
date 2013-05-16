class Post < ActiveRecord::Base
  attr_accessible :content, :title, :created_at
end
