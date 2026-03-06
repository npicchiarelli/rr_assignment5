# Particle Diameter Analysis

A Julia pipeline for processing microscopy data: computes GUV diameters from area measurements, converts pixel units to microns, and generates summary statistics and distribution plots.

## Files

- **`analysis_code.jl`** — Main analysis script. Reads raw CSV data, computes diameters, saves processed outputs, prints summary statistics, and generates histogram plots.
- **`utilities.jl`** — Helper functions for unit conversion (imported by `analysis_code.jl`).

## Directory Structure

The script expects the following layout relative to the script's location:

```
project/
├── analysis_code/
│   ├── analysis_code.jl
│   └── utilities.jl
├── raw_data/
│   ├── metadata.json
│   └── *.csv
├── processed_data/       # auto-created if missing
└── outputs/
    └── plots/            # auto-created if missing
```

## Input Format

### `raw_data/metadata.json`
Must contain a `scale-factor-px-micron` field specifying pixels per micron:
```json
{
  "scale-factor-px-micron": 2.5
}
```

### `raw_data/*.csv`
Each CSV file must include an `Area_px` column containing particle areas in pixels.

## Output

- **`processed_data/*_processed.csv`** — One file per input CSV, containing `Area_px` and `Diameter_μm` columns.
- **`outputs/plots/diameter_distributions.png`** — A histogram panel showing the diameter distribution for each processed file.
- **Terminal** — A summary table of min, max, and median diameter per file.

## Dependencies

Install the required Julia packages before running:

```julia
using Pkg
Pkg.instantiate()
```

To install packages manually:

```julia
using Pkg
Pkg.add(["CSV", "DataFrames", "JSON", "Plots", "Statistics"])
```

## Usage

Run from the `analysis_code/` directory (or any directory — `@__DIR__` ensures correct path resolution):

```bash
julia analysis_code.jl
```

or run in the [VS Code Julia extension](https://code.visualstudio.com/docs/languages/julia)

## Utility Functions

Defined in `utilities.jl`:

| Function | Description |
|---|---|
| `area2diam(area)` | Returns the diameter of a circle with the given area: `2 * sqrt(area / π)` |
| `px2micron(length, scale_factor)` | Converts a pixel length to microns: `length / scale_factor` |