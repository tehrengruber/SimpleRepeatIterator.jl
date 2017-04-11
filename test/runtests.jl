using SimpleRepeatIterator
using Base.Test

# write your own tests here
@test collect(repeat(1:2, inner=2)) == [1, 1, 2, 2]
@test collect(repeat([1, 2], inner=2)) == [1, 1, 2, 2]

@test collect(repeat([1, 2], outer=2)) == [1, 2, 1, 2]
@test collect(repeat(1:2, outer=2)) == [1, 2, 1, 2]

@test collect(repeat(1:2, inner=3, outer=2)) == [1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2]

@inferred collect(repeat([1, 2], inner=2))
@inferred collect(repeat([1, 2], outer=2))
@inferred collect(repeat([1, 2], inner=3, outer=2))
