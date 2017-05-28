module Truthy
  def if_true &block
    block.call
  end

  def if_false &_
    self
  end
end

module Falsy
  def if_true &_
    self
  end

  def if_false &block
    block.call
  end
end

class Object; include Truthy; end
class FalseClass; include Falsy; end
class NilClass; include Falsy; end
