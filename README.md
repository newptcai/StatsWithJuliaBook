# Statistics with Julia: Fundamentals for Data Science, Machine Learning and Artificial Intelligence

This is a fork of the original repository [here](https://github.com/h-Klok/StatsWithJuliaBook) by
H.Klok and Y.Nazarathy.
It is meant to keep the code update to the latest version of Julia.

## Usage instructions:

### Install Julia and packages

1. Clone or download this repository or a fork of it.
2. Have Julia 1.7.2 or above installed.
3. Have R installed. (For otherwise you cannot use the package `RCall`
4. Run init.jl to install and precompile the required packages.
5. Run individual code examples.

### Using docker

Alternatively, 
if you use docker containers on Linux, 
you can also run these code by

```
docker pull newptcai/statswithjulia
docker run --rm -it newptcai/statswithjulia
```
