class Input
  def user_input
    array = []
    puts "please enter the number of inputs"
    a = gets.chomp.to_i
    i = 0
    sum1 = 0
    sum2 = 0
    sum = 0
    k1 = 0
    k2 = 0
    k3 = 0
    k4 = 0
    puts "enter inputs"
    for i in 0...a
      array[i] = gets.chomp
      a = array[i].split[0]
      b = array[i].split[-1]
      c = a.to_f*b.to_f
      if array[i].split.include?("imported")
        if array[i].split.include?("book") || array[i].split.include?("chocolates") || array[i].split.include?("pills" ) || array[i].split.include?( "chocolate") 
          d = '%.2f' %[(c.to_f*5)/100]
          k = c.to_f + d.to_f.round(2)
          g = array[i].split()
          g[-1] = k.to_f
          array[i] = array[i].split()
          array[i] = g
          sum1 = sum1.to_f + d.to_f
          k1 = k1.to_f + k 
        else
          d = '%.2f' %[(c.to_f*15)/100]
          k = c.to_f + d.to_f.round(2)
          g = array[i].split()
          g[-1] = k.to_f
          # array[i] = d + array[i]
          array[i] = array[i].split()
          array[i] = g
          sum = sum.to_f + d.to_f
          k2 = k2.to_f + k.to_f
        end
      elsif array[i].split.include?("book") || array[i].split.include?("chocolates") || array[i].split.include?("pills" ) || array[i].split.include?( "chocolate")
        array[i] = array[i]
        k = '%.2f' %[c.to_f].round(2)
        k4 = k4.to_f + k.to_f 
      else
        d = '%.2f' %[(c.to_f*10)/100.0]
        k = (c.to_f + d.to_f).round(2)
        g = array[i].split()
        g[-1] = k.to_f
        array[i] = array[i].split()
        array[i] = g
        sum2 = sum2.to_f + d.to_f
        k3 = k3.to_f + k.to_f
      end
      array[i] = array[i].join(" ")
    end
    total = sum1.to_f + sum2.to_f + sum.to_f
    all_total = k1.to_f + k2.to_f + k3.to_f + k4.to_f
    puts "Invoice Output"
    puts "#{array.join("\n")}"
    puts "sales tax is #{total}"
    puts "total amount #{all_total}"
  end
end

a = Input.new
a.user_input