class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    range = (1..100).to_a
    output = 100

    return output if self.length == 0

    self.each.with_index do |int, idx|
      index = range.index(int)
      index ||= 1111

      if idx % 2 == 0
        output += index.hash
      else
        output -= index.hash
      end
    end

    output

  end
end

class String
  def hash
    alph = ("a".."z").to_a
    output = 100

    return output if self.length == 0

    self.each_char.with_index do |char, idx|
      index = alph.index(char)
      index ||= 11

      if idx % 2 == 0
        output += index.hash
      else
        output -= index.hash
      end
    end

    output

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    output = 111
    return output if self.empty?

    self.each() do |k,v|
      if k.is_a?(Symbol)
        output += k.to_s.hash
      else
        output += k.hash
      end
      
      output += v.hash
    end

    output
  end
end
