class Hash
  def get_if_absent_put key, &put_block
    if !has_key? key
      self[key] = put_block.call
    end
    self[key]
  end
end
