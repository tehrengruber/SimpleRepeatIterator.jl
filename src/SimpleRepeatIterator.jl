module SimpleRepeatIterator

import Base: start, next, done, length, eltype, repeat, size, getindex

immutable RepeatIterator{IT}
  v::IT
  inner::Int
  outer::Int
end

start(it::RepeatIterator) = (0, 1, 1) # (index, inner repititon, outer repition)
function next(it::RepeatIterator, state::Tuple{Int, Int, Int})
  nval = it.v[state[1]+1]
  nstate = if state[2] == it.inner
    if state[3] != it.outer && state[1] == length(it.v)-1
      (0, 1, state[3]+1)
    else
      (state[1]+1, 1, state[3])
    end
  else
    (state[1], state[2]+1, state[3])
  end
  (nval, nstate)
end
done(it::RepeatIterator, state::Tuple{Int, Int, Int}) = state[1]==length(it.v) && state[3]==it.outer
length(it::RepeatIterator) = length(it.v)*it.inner*it.outer
size(it::RepeatIterator) = (length(it),)
eltype(it::RepeatIterator) = eltype(it.v)
function getindex(it::RepeatIterator, i)
  @boundscheck i<=length(it) || throw(BoundsError(it, i))
  #it.v[ceil(Int, (((i-1)%it.outer)+1)/it.inner)] # not correct, todo: check that i<length
  it.v[(ceil(Int, i/it.inner)-1)%(length(it.v))+1]
end

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
repeat(v::AbstractVector; inner=1, outer=1) = RepeatIterator(v, inner, outer)

end # module
