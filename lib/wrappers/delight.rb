require "wrappers/delight/version"

module Wrappers
  module Delight
    class Error < StandardError; end
    class WordWrap
      def wrap(string, max_width)
  	     return string if string.length <= max_width
	       if string[0...max_width].index(" ") != nil
	         space_pos = string.rindex(" ")
	         string[0...space_pos] + "\n" + wrap(string[space_pos+1..-1],max_width)
	       elsif string[max_width]==" "
	         string[0...max_width] + "\n" + wrap(string[max_width+1..-1], max_width)
	       else
           string[0...max_width] + "\n" + wrap(string[max_width..-1],max_width)
	       end
      end
    end
  end
end
