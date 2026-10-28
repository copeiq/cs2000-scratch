use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L

fun my-doubles(lst :: List<Number>) -> List<Number> block: 
    
  doc: "takes a list of numbers and multiplies each value in the List by 2 and returns the new list"
  
  L.build-list(
    
    lam(e):
      lst.get(e) * 2
    end, 
    
    lst.length() 
    
    )
where:
  my-doubles([list: 10, 20, 30]) is [list: 20, 40, 60] 
  
end


my-doubles([list: 10, 20, 30]) 


fun my-doubles-map(lst :: List<Number>) -> List<Number> block:
  
  doc: "same as first but uses maps instead"
  
  L.map(
    
    lam(e): 
      e * 2 
    end, 
    
   lst
    
   )

end


my-doubles-map([list: 10, 20, 30])


# map is easier

fun my-string-lens(lst :: List<String>) -> List<Number> block:
  
  doc: "takes a list of strings and returns a new list where each element is the length of the string in the corresponding position in the input list."
  
  L.build-list(
    
    lam(e):
      lst.map(string-length)
    end,
    
    1
    
  )
  
  
  
  
end

my-string-lens([list: "e", "ea", "ear"])