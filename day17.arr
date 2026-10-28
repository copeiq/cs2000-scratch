use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
var score = 10

fun bonus-points(amt :: Number) -> Number block:
  score := score + amt
  penalty-check()
end
fun penalty-check() -> Number block:
  when score > 15:
    score := score - 3
  end
  score
end

bonus-points(2)
bonus-points(4) 
bonus-points(1)



# 

# 2 -> 12

# 12 + 4 = 16 - 3 = 13

# 13 + 1 = 14



var dta = [list: 1, 2, 3]
var position = 0


fun advance() -> Number block:
  
  
  
  result = dta.get(position)
  
  # 2
 
  
  position := position + 1
  
  # 1


  when position >= length(dta) block:
    position := 0
    dta := [list: 0] + dta
  end
  result
  
  #2
end
fun process-data() -> Number block:
  first = advance() # 1)
  second = advance() # 2
  first + second # 3
end

process-data() # 3
process-data()
process-data()


