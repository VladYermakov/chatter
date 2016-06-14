module MessagesHelper
  def get_variants
    ['Create room'] + (1..Room.count).to_a
  end
end
