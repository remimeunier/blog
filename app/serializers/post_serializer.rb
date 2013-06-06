class PostSerializer < ActiveModel::Serializer
  attributes :id,:title, :content, :image, :genre, :next_post, :prev_post, :link, :autorized

  def genre
  	object.genre.name
  end

  def prev_post
  	p = Post.first(:conditions => ["id < ?", object.id], :order => "id desc")
  	
  	if p != nil
  		p.id
  	else
  		Post.last.id
  	end
  end

  def next_post
  	p = Post.first(:conditions => ["id > ?", object.id], :order => "id asc")
  	if p != nil
  		p.id
  	else
  		Post.first.id
  	end
  end

  def autorized
    if current_user != nil and (current_user.is_admin? or object.user_id == current_user.id)
      true
    end
  end

end
