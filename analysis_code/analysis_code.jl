using CSV
using DataFrames
using JSON
using Statistics

raw_data_dir = normpath(joinpath(@__DIR__, "..", "raw_data")) # For reproducibility, it is absolute but @__DIR__ outputs the pwd as a string
processed_data_dir = normpath(joinpath(@__DIR__, "..", "processed_data"))

# Check if directory exists
!isdir(raw_data_dir) && begin
    error("Raw data directory does not exist: $raw_data_dir")
end

metadata = JSON.parsefile(joinpath(raw_data_dir, "metadata.json"))
scale_factor = metadata["scale-factor-px-micron"]

df = DataFrame() # Initialize empty DataFrame

for file in readdir(raw_data_dir)
    println("Found file: $file")
    if endswith(file, ".csv") # Filter for CSV files
        println("Processing file: $file")
        data = CSV.read(joinpath(raw_data_dir, file), DataFrame)
        data.Diameter_px = 2 * sqrt.(data.Area_px ./ π)
        data.Diameter_μm = data.Diameter_px ./ scale_factor

        processed_data_fname = replace(file, ".csv" => "_processed.csv")
        CSV.write(joinpath(processed_data_dir, processed_data_fname), data[:,[:Area_px, :Diameter_μm]]) # Save only relevant columns
    end
end
