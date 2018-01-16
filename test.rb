require 'test/unit'
require './bakery'

class BakeryTest < Test::Unit::TestCase

  def setup
    @bakery = Bakery.new
  end

  def test_order_with_single_line
    assert_equal(@bakery.order("10 VS5"), "10 VS5 $17.98\n2 x 5 $8.99\n")
  end

  def test_order_with_multiple_lines
    assert_equal(@bakery.order("21 VS5\n27 MB11\n28 CF"),
      "21 VS5 $40.95\n" +
      "3 x 5 $8.99\n" +
      "2 x 3 $6.99\n" +
      "27 MB11 $96.7\n" +
      "2 x 8 $24.95\n" +
      "1 x 5 $16.95\n" +
      "3 x 2 $9.95\n" +
      "28 CF $53.88\n" +
      "2 x 9 $16.99\n" +
      "2 x 5 $9.95\n")
  end

  def test_order_with_multiple_and_redundant_lines
    assert_equal(@bakery.order("10 VS5\n\n14 MB11\n\n13 CF\n"), 
      "10 VS5 $17.98\n2 x 5 $8.99\n14 MB11 $54.8\n1 x 8 $24.95\n" +
      "3 x 2 $9.95\n13 CF $25.85\n2 x 5 $9.95\n1 x 3 $5.95\n")
  end

end