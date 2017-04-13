using SimpleRepeatIterator
using Base.Test

@test collect(repeat(1:2, inner=2)) == [1, 1, 2, 2]
@test collect(repeat([1, 2], inner=2)) == [1, 1, 2, 2]

@test collect(repeat([1, 2], outer=2)) == [1, 2, 1, 2]
@test collect(repeat(1:2, outer=2)) == [1, 2, 1, 2]

@test collect(repeat(1:2, inner=3, outer=2)) == [1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2]

# test getindex
let res = [1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2],
    r = repeat(1:2, inner=3, outer=2)
  for i=1:length(res)
    @test r[i] == res[i]
  end
end

@inferred collect(repeat([1, 2], inner=3, outer=2))

let r=repeat([1, 2], inner=2)
  @inferred r[1]
  @inferred collect(r)
  @inferred collect(r)
  @test eltype(typeof(r)) == Int
  @test eltype(zip(r, r)) == Tuple{Int, Int}
end
