
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(8)
stream-c = stream(3)
merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)

fun total-flow(r :: River) -> Number:
    doc: "idk"

  cases(River) r:
      | stream(flow) => flow
    | merge(w, l, right) => total-flow(l) + total-flow(right)
    end
where:
    total-flow(stream-a) is 5
end




fun max-width(r :: River) -> Number:
  doc: "idk"

  cases(River) r:
    | stream(_) => -1
    | merge(w, l, right) => 
      
      num-max(w, num-max(max-width(l), max-width(r)))
      
   end
where:
  max-width(main-river) is 15
end

fun widen-river(r :: River, n :: Number) -> River:
    cases(River) r:
    | stream(_) => 0
    | merge(w, l, right) => 
      
      merge((w + n), widen-river(l, n), widen-river(right, n))
      
   end
where:
  widen-river(main-river, 10) is 25
end

fun cap-flow(r :: River) -> River:
  cases(River) r:
    | stream(flow) => 
      if flow > 10:
        stream(10)
      else:
        stream(flow)
      end
    | merge(w, l, right) => 

      merge(w, cap-flow(l), cap-flow(r))
  end
  
end