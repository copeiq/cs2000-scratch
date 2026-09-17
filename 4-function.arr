use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


#| takes 2 parameters price and percentage that u input and the function returns 2 numbers which is discounted price and saved price |#

fun c(price :: Number, percentage :: Number) -> {Number; Number}:
  
  # 100
  Hundred = 100
  
  # discounted price
  discounted = price * ((Hundred - percentage) / Hundred)

  # saved amount
  saved = price - discounted

  # returns
  {discounted; saved}

end


c(25.49, 15)



#|

fun with cakes
Your goal is to draw an image of a three layer cake. Each cake consists of three equally sized rectangular layers, and the only difference is the color (or "flavor") of each layer. You can choose the colors!
Now, draw another cake with different flavors (i.e., colors). Notice what is different, and what is the same.
Define a new function, three-layer-cake that takes as arguments the three parts that change: the color of the top, middle, and bottom colors.
Be sure to give it a type annotation and docstring.
Now use this new function to rewrite both of your past examples, and notice how much easier it is to read even though the behavior is the same: this is your second example of Design -- just like constant definitions can make expressions easier to read, by splitting large expressions into smaller parts or giving meaning to numbers, functions give names to repeated computations.

|#

#|
firstcake = rectangle(100, 30, "solid", "white")
secondcake = rectangle(100, 30, "solid", "red")
thirdcake = rectangle(100, 30, "solid", "white")

above(above(firstcake, secondcake), thirdcake)

|#
   
fun three-layer-cake(
    l :: Number, 
    w :: Number, 
    topcolor :: String, 
    middlecolor :: String, 
    bottomcolor :: String) 
  -> Image:

  
  # doc
  doc: "returns an image of a cake by a user inputting a length, width, color for each cake (top, middle bottom)"
  
  # solid
  solid = "solid"
  
  # first layer
  layerfirstcake = rectangle(l, w, solid, topcolor)
  
  # second layer
  layersecondcake = rectangle(l, w, solid, middlecolor)
  
  # third layer
  layerthirdcake = rectangle(l, w, solid, bottomcolor)

  # puts first cake on top of second cake and second cake above third cake
  above(above(layerfirstcake, layersecondcake), layerthirdcake)  
  

end

three-layer-cake(100, 30, "white", "red", "white")




fun tshirt-cost(
    ShirtCount :: Number, 
    Message :: String)
    -> Number:

  doc: "It takes the amount of shirts you bought and multiplies by 5 dollars since 5 dollar per shirt and then takes the length of a message for each shirt and multiply by 10 cents and by shirt count cuz per shirt"
  
  totalprice = (ShirtCount * 5.00) + (ShirtCount *  (string-length(Message) * 0.10))
  
  totalprice
end


tshirt-cost(50, "Hello World")
