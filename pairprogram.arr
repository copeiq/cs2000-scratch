use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# size price
fun size-price(size :: String) -> Number:
  
  doc: "takes size personal or large and returns the price based off it"
  
  # if size is personal then it is 8 dollars
  if (size == "personal"):
    8
    
    # otherwise it is 14 dollars because it is large
  else:
    14
  end
where:
  
  # tests
  size-price("personal") is 8
  size-price("large") is 14
  
end

fun topping-price(toppings :: Number) -> Number:
  doc: "input a number of toppings and returns a price"
  
  if (toppings < 3):
    0
  else:
    
    # first 2 toppings are free so you need to subtract to get the amount of toppings that actually cost.
    price = (toppings - 2) * 1.25 
    price
  end
  
where:
  topping-price(2) is 0
  topping-price(-1) is 0
  topping-price(1) is 0
  topping-price(3) is 1.25
  topping-price(5) is 3.75
end



fun order-total(size :: String, toppings :: Number, is-pickup :: Boolean) -> Number:
  doc: "takes a size, topping, and a boolean whether picking up is true and returns a price. If pickup is true then 2 dollar discount"
  
  total = (topping-price(toppings) + size-price(size)) 
  
  if (is-pickup):
    total - 2
  else:
    total
  end
  
where:
  order-total("personal", 0, true) is 6
  order-total("large", 3, false) is 15.25 
  order-total("large", 3, true) is 13.25 
  order-total("personal", 2, false) is 8 
end

fun receipt(name :: String, size :: String, toppings :: Number, is-pickup :: Boolean) -> String:
  
  
  doc: "same thing as order total function but you add a name and what you bought, if you are picking up it will show in the receipt" 
  
  
  theReceipt = name + "\n" + size + " pizza, " + num-to-string(toppings) + " toppings " + "(pickup)" + "\n" + "Total: $" + 
      num-to-string-digits(
        order-total(size, toppings, is-pickup), 2)
  
  if (is-pickup):
    print(theReceipt)
  else:

    print(name + "\n" + size + " pizza, " + num-to-string(toppings) + " toppings " + "\n" + "Total: $" + 
      num-to-string-digits(
        order-total(size, toppings, is-pickup), 2)
      )
  end
  
end

receipt("Rin", "large", 3, true)
receipt("Rin", "large", 3, false)



fun receipt-image(name :: String, size :: String, toppings :: Number, is-pickup :: Boolean) -> Image:
  doc: "same thing as order total function but you add a name and what you bought, if you are picking up it will show in the receipt "
  
end