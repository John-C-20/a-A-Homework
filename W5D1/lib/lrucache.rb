  class LRUCache
    def initialize(s)
        @size = s
        @num_elements = 0
        @cache = []
    end

    def count
        num_elements
    end

    def add(el)
      index = cache.index(el)
      if index == nil
        if num_elements < size 
            cache[num_elements] = el
            @num_elements += 1
        else
            cache.shift
            cache << el
        end
      else
        self.cache = cache[0...index] + cache[index+1..-1]
        if num_elements < size 
          cache[num_elements - 1] = el
        else
          cache << el
        end
      end
    end

    def show
      p cache
    end

    private
      attr_accessor :size, :num_elements, :cache

  end

  # johnny_cache = LRUCache.new(4)

  # johnny_cache.add("I walk the line")
  # johnny_cache.add(5)

  # johnny_cache.show 

  # johnny_cache.count # => returns 2

  # johnny_cache.add([1,2,3])
  # johnny_cache.add(5)
  # johnny_cache.add(-5)
  # johnny_cache.add({a: 1, b: 2, c: 3})

  # johnny_cache.add([1,2,3,4])
  # johnny_cache.add("I walk the line")
  # johnny_cache.add(:ring_of_fire)
  # johnny_cache.add("I walk the line")
  # johnny_cache.add({a: 1, b: 2, c: 3})


  # johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]