class ExampleTrace
  def self.run
    1 + 2

    three = lambda { 3 }

    val = 2.times { three.call }

    val * 4

    '5'
  end
end
