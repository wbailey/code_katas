# Code kata for word wrap
#
# Take this kata with the "kata" gem.

require 'kata'

kata "WordWrap" do
  requirement %q{Create a "WordWrap" class that is initialized with an integer parameter} do
    detail "The parameter is the wrap column"
    example %q{WordWrap.new 4}
    detail "Non-integer parameters raise an exception"
    example %q{WordWrap.new raises an exception}
    example %q{WordWrap.new "foo" raises an exception}
  end

  context %q{"wrap" method} do
    requirement "Create a wrap method that takes a string parameter" do
      example %q{WordWrap.new(5).wrap "this is text"}
      detail "The method should raise an exception for non-string parameters"
      example %q{WordWrap.new(4).wrap([1,2,3]) raises an exception}
    end

    requirement "It should wrap the empty string to an empty string" do
      example %q{WordWrap.new(4).wrap("") returns ""}
    end

    requirement "It should return one short word as-is" do
      example %q{WordWrap.new(6).wrap("word") returns "word"}
    end

    requirement "It should wrap text at the last space before the wrap length" do
      example %q{WordWrap.new(5).wrap("word word") returns "word\nword"}
      example %q{WordWrap.new(5).wrap("word word word") returns "word\nword\nword"}
      example %q{WordWrap.new(10).wrap("word word word") returns "word word\nword"}
    end

    requirement "Long words without spaces should be broken at the wrap length" do
      example %q{WordWrap.new(4).wrap("wordword") returns "word\nword"}
    end
  end
end
