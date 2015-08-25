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
        roman << Converter.convert_digit_num(get_digit(3), 'C', 'D', 'M')
        roman << Converter.convert_digit_num(get_digit(2), 'X', 'L', 'C')
        roman << Converter.convert_digit_num(get_digit(1), 'I', 'V', 'X')
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
    def self.convert_digit_num(num, one, five, ten)
      roman = ''
      if num <= 3
        num.times { roman << one }
      elsif num <= 5
        (5 - num).times { roman << one }
        roman << five
      elsif num <= 8
        roman << five
        (num - 5).times { roman << one }
      else
        (10 - num).times { roman << one }
        roman << ten
      end
      roman
    end
  end
end

Fixnum.send :include, Arabman
