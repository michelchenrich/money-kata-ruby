class Array
  def sum
    total, *rest = self
    rest.each { |element| total += element } 
    total
  end

  def push_top element
    unshift element
  end
end
