module Launch
  class Queue
    def initialize
      @queue = Array.new
    end

    def enter(data)
      @queue << data
    end

    def leave
      raise QueueIsEmpty if self.empty?
      
      @queue.delete_at(0)
    end

    def peek
      @queue[0]
    end

    def empty?
      @queue.empty?
    end
  end

  class QueueIsEmpty < StandardError
  end
end
