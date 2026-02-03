"""
    area2diam(area)
Computes the diameter of a circle with given area.

# Examples
```julia-repl
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
```
"""
function px2micron(length, scale_factor)
    return length / scale_factor
end