class Bakery

  attr_accessor  :menu, :lines, :type, :keys, :order_output


  def initialize
    vs = {5 => 8.99, 3 => 6.99}
    bm = {8 => 24.95, 5 => 16.95, 2 => 9.95}
    cf = {9 => 16.99, 5 => 9.95, 3 => 5.95}

    @menu = {'VS5': vs, 'MB11': bm, 'CF': cf}
  end


  def order(input="")
    @order_output = ""
    # input for multiple lines, to stop it type 0 in the new line
    input = gets("\n0").chomp("\n0") if input == ""

    # remove redundant whitespaces 
    @lines = input.lines
    @lines = @lines.map! {|l| l = l.strip}.select {|l| l != ""}

    lines.each do |line|
      arr = line.split(' ')

      amount = arr[0].to_i
      @type = arr[1]
      @keys = @menu[@type.to_sym].keys

      comply_order(amount, line)
    end

    #puts output # uncomment this line to view output in console/terminal
    output
  end


  def output
    @order_output
  end


  def comply_order(amount, line)
    
    ans_hash = get_pack(amount)                         # find solution for current order line

    count = 0
    details = ""

    @menu[@type.to_sym].each do |key, value|            # for each pack

      if ans_hash.key? key and ans_hash[key] != 0       # if we need it (it is > 0 in answer hash)
        count += (ans_hash[key] * value).round(2)
        details += "#{ans_hash[key]} x #{key} $#{value}\n" # format output  like '2 x 5 $8.99'
      end

    end
    @order_output += "#{line} $#{count.round(2)}\n" + details # get together output for the order line
  end


  def get_pack (remainder, index=0, ans={})
    pack = @keys[index]                                 # amount of items in current pack

    if remainder < pack

      if @keys.size != index + 1 and remainder > @keys[index + 1]
        ans[pack] = 0                                   # 0 if we can choose next pack
        return get_pack(remainder, (index + 1), ans)

      elsif @keys.size == index + 1 and ans[@keys[index - 1]] != 0 # change if we get stuck
        ans[@keys[index - 1]] -= 1                      # remove one previous pack
        remainder += @keys[index -1]                    # add removed to the remainder
      end
    end

    #if we stuck on last step (modulo for the smallest pack is > 0)
    if @keys.size == index + 1 and remainder.modulo(@keys[index]) > 0 and ans[@keys[0]] > 0
      temp = ans[@keys[0]]
      ans = {@keys[0] => temp - 1}                      # replace ans with modified first-stage-hash
      return get_pack(remainder + @keys[0], 1, ans)     # step back for second pack 
    end

    ans[pack], remainder = remainder.divmod(pack)       # divmod => [divide, modulo] (for int)

    return ans if remainder == 0                        # order is ready

    get_pack(remainder, (index + 1), ans)               # try to fit next (smaller) package
  end

end


# uncomment these lines to test class by yourselves
# bakery = Bakery.new
# bakery.order
