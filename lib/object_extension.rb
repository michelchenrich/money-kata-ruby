class Object
  def exposes *names
    attr_reader *names
  end 
end
