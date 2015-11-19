require "arabman/version"

module Arabman
  extend self

  def to_roman
    raise RangeError unless (1..3999).include?(self)

    number = ''
    number << 'M' * digit(4)
    number << Translator.excute(digit(3), 'C', 'D', 'M')
    number << Translator.excute(digit(2), 'X', 'L', 'C')
    number << Translator.excute(digit(1), 'I', 'V', 'X')
    number
  end

  private

  def digit(num)
    self % (10 ** num) / 10 ** (num - 1)
  end

  module Translator
    def self.excute(num, one, five, ten)
      if num <= 3
        one * num
      elsif num <= 5
        one * (5 - num) << five
      elsif num <= 8
        five << one * (num - 5)
      else
        one * (10 - num) << ten
      end
    end
  end
end

Fixnum.send :include, Arabman
