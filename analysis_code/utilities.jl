"""
    area2diam(area)
Computes the diameter of a circle with given area.

# Examples
```julia-repl
julia> area = 100
100

julia> d = area2diam(area)
11.283791670955125

julia> π*(d/2)^2
99.99999999999999
```
"""
function area2diam(area)
    return 2 * sqrt(area / π)
end

"""
    px2micron(length, scale_factor)
Computes the length in microns given a length in pixels and a scale factor.

# Examples
```julia-repl
julia> px2micron(100, 2.5)
40.0
```
"""
function px2micron(length, scale_factor)
    return length / scale_factor
end