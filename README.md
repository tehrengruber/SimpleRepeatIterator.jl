# SimpleRepeatIterator

Construct an iterable object by repeating the individual entries of `v` `inner` times.
```
collect(repeat(1:2, 2))
4-element Array{Int64,1}:
 1
 1
 2
 2
```

Note that similar functionality is already provided by `Base.repeat`. This package
however does not allocate the the complete sequence, but provides an iterable
object. Additionally everything is type stable.

# License

MIT
