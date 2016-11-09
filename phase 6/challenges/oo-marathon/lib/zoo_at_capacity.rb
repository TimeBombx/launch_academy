class ZooAtCapacity < StandardError
  def initialize(msg="Zoo is at capacity")
    super(msg)
  end
end