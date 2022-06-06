# Snakemake compression test repo

## Usage

1. Clone this repository
2. Use `cd` to make it your working directory run `snakemake -c1`.
3. To re-run, delete `output` directory, then run `snakemake -c1` again

## Instructions

Currently, the `compression` rule removes the files
that are needed for the `combine` rule.
This is similar to the way that compression of the `kneaddata` files
would get removed before they could be used by `humann` and `metaphlan`.

Use this repository to play with different possibilities.
Don't forget to make a new branch and open a pull-request
when you have some code (even if it doesn't work!).