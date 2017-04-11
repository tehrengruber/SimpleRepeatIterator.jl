module SimpleRepeatIterator

import Base: start, next, done, length, eltype, repeat

immutable RepeatIterator{IT}
  v::IT
  inner::Int
end

start(it::RepeatIterator) = (0, 1) # (index, repititon)
function next(it::RepeatIterator, state::Tuple{Int, Int})
  (it.v[state[1]+1], state[2] == it.inner ? (state[1]+1, 1) : (state[1], state[2]+1))
end
done(it::RepeatIterator, state::Tuple{Int, Int}) = state[1]==length(it.v)
length(it::RepeatIterator) = length(it.v)*it.inner
eltype(it::RepeatIterator) = eltype(it.v)

"""
Construct an iterable by repeating the individual entries of `v` `inner` times.
```
collect(repeat(1:2, 2))
4-element Array{Int64,1}:
 1
 1
 2
 2
```
"""
repeat(v::AbstractVector, inner::Int) = RepeatIterator(v, inner)

end # module
