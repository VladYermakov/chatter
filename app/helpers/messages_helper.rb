module MessagesHelper

  def get_variants
    ['Create room'] + (1..Room.count).to_a
  end

  def clear_cookies
    cookies.delete(:room)
  end

end
