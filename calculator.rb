class SalesTaxes

  TAX_EXCEPT_ITEMS = ["chocolates","book","pills","chocolate"]

  def initialize
    user_inputs = user_input
    puts "Invoice Output"
    get_output(user_inputs)
  end

  def user_input
    array = []
    puts "please enter number of inputs"
    num = gets.to_i
    puts "enter inputs"
    (1..num).each do |val|
      array << gets.chomp
    end
    array
  end
 
  def get_output(user_input_ary)
    total_tax = 0
    total_price = 0
    user_input_ary.each do |item|
      qty = item.split()[0].to_i
      price = item.split()[-1].to_f * qty.to_f
      product = item.split(" at ")[0].delete("/0-9/").strip
      tax = tax_calculation(price, product)
      total_tax += tax
      tax_price = (price.to_f + tax)
      total_price += tax_price
      puts "#{qty} #{product}: #{tax_price.round(2)}"
    end
    puts "Sales Tax: #{total_tax.round(2)}"
    puts "Total: #{total_price.round(2)}"
  end
 
  def tax_calculation(price, product)
    tax = 0
    tax_exclude = []
    tax_exclude = product.split(" ") & TAX_EXCEPT_ITEMS
    tax = price.to_f * 0.05 if product.include?('imported')
    tax = (price.to_f * 0.10) + tax.to_f if tax_exclude.count != 1
    tax
  end
end

SalesTaxes.new