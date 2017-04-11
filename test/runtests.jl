using SimpleRepeatIterator
using Base.Test

# write your own tests here
@test collect(repeat(1:2, 2)) == [1, 1, 2, 2]
@test collect(repeat([1, 2], 2)) == [1, 1, 2, 2]
