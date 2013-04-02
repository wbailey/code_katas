require 'kata'
require 'launchy'

kata "GitHub" do
  requirement "Visit http://try.github.com/levels/1/challenges/1" do
    Launchy.open("http://try.github.com/levels/1/challenges/1")
  end
end
