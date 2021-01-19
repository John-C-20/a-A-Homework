class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[0]
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key,value)
        if @map.any? {|pair| pair[0] == key}
            @map.each {|pair, i| pair[0] == key ? pair[1] = value : pair = pair }
        else
            @map << [key, value]
        end
    end

    def get(key)
        @map.each do |pair|
           return pair[1] if pair[0] == key
        end
    end

    def delete(key)
        @map.each_with_index do |pair, idx|
            if pair[0] == key
                @map[0..-1] = @map[0...idx] + @map[idx+1..-1]
                return @map
            end
        end
    end

    def show
        @map
    end
end

s = Stack.new
p s.push("John")
p s.push("Cheung")
p s.push(1)
p s.push(2)
p s.pop
p s.peek
p "---"
q = Queue.new
p q.enqueue("John")
p q.enqueue("Cheung")
p q.enqueue(1)
p q.dequeue
p q.peek
p "---"
m = Map.new
p m.set("first_name","John")
p m.set("last_name", "Cheung")
p m.get("first_name")
p m.delete("first_name")
p m.show