using Tables, StatsPlots, Distributions, CSV, DataFrames, Measures; gr()

realData = CSV.read("../data/temperatures.csv", DataFrame)

N = 10^5
include("../data/mvParams.jl")
biNorm = MvNormal(meanVect,covMat)
syntheticData = DataFrame(Tables.table(rand(MvNormal(meanVect,covMat),N)'))
rename!(syntheticData,[:Column1=>:Brisbane, :Column2 => :GoldCoast])

default(c=cgrad([:blue, :red]), 
    xlabel="Brisbane Temperature", 
    ylabel="Gold Coast Temperature")

p1 = marginalhist(realData.Brisbane, realData.GoldCoast, bins=10:45)
p2 = marginalhist(syntheticData.Brisbane, syntheticData.GoldCoast, bins=10:.5:45)

plot(p1,p2, size = (1000,500), margin = 10mm)
