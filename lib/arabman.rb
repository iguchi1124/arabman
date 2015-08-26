require "arabman/version"

module Arabman
  def self.included(klass)
    klass.send(:include, Arabman::InstanceMethods)
  end

  module InstanceMethods

    def to_roman
      begin
        raise RangeError.new("Please enter a number between 1 and 3999.") unless (1..3999).include?(self)
        roman = ''
        get_digit(4).times { roman << 'M' }
        roman << Converter.execute(get_digit(3), 'C', 'D', 'M')
        roman << Converter.execute(get_digit(2), 'X', 'L', 'C')
        roman << Converter.execute(get_digit(1), 'I', 'V', 'X')
        roman
      rescue => errors
        errors
      end
    end

    private

    # 145.get_digit(2) => 4
    def get_digit(num)
      self % (10 ** num) / 10 ** (num - 1)
    end
  end

  module Converter

    # convert_digit_num(8, 'I', 'V', 'X') => 'VIII'
    def self.execute(num, one, five, ten)
      roman = ''
      if num <= 3
        roman << one * num
      elsif num <= 5
        roman << one * (5 - num)
        roman << five
      elsif num <= 8
        roman << five
        roman << one * (num - 5)
      else
        roman << one * (10 - num)
        roman << ten
      end
      roman
    end
  end
end

Fixnum.send :include, Arabman
