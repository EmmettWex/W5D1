class LRUCache
    def initialize(n)
        @max_size = n
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
        if @cache.include?(el)
            sort_cache(el)
        else
            if full?
                @cache.shift
                @cache.push(el)
            else
                @cache.push(el)
            end
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
        p @cache
    end

    private
    # helper methods go here!

    def full?
        @cache.length >= @max_size
    end

    def sort_cache(el)
        # bubble sort the cache to move the recently called element to the back
        # and shift each element behind it.
        index = @cache.index(el)

        # this simply deletes and places the element at the end of the array
        # ele = @cache.delete_at(index)
        # @cache.push(ele)

        # this bubble sorts the elements, this way the most recently used
        # element is not ever deleted from the cache.
        @cache[index..-2].each.with_index do |ele, idx|
            i = index + idx
            @cache[i], @cache[i+1] = @cache[i+1], @cache[i]
        end

    end
end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]