use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

"hello CS2000!"
string-to-upper("hello CS2000!")
c = circle(30, "solid", "blue")

#| ```70 is width and 30 is height```
   ```30 is radius of circle btw``` |#

r = rectangle(70, 30, "solid", "yellow")
overlay(c, r)


r1 = rectangle(70, 30, "solid", "purple")
r2 = rectangle(70, 30, "solid", "red")
above(r1, r2)

r3 = rectangle(100, 20, "solid", "red")
rotate(90, r3)
rotate(180, r3)


STOP_sign = regular-polygon(40, 8, "solid", "red") 

SIGN = text-font("STOP", 10, "white", "Highway Gothic", "swiss", "normal", "bold", false)

overlay(SIGN, STOP_sign)
