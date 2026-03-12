include("../analysis_code/utilities.jl") # Include the utilities module for testing
using .Utilities # Use the Utilities module to access the functions.
using Test

@testset "Utilities Test Suite" begin

    @testset "area2diam" begin
        area = 100
        d = area2diam(area)
        @test d ≈ 11.28 atol=0.01
        @test π*(d/2)^2 ≈ 100 atol=0.01
    end

    @testset "px2micron" begin
        @test px2micron(100, 2.5) == 40.0
    end

end
