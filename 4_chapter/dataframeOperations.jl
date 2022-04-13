using DataFrames, CSV, Dates, Statistics, CategoricalArrays
data = dropmissing(CSV.read("data/purchaseData.csv", DataFrame))

data[!,:Date] = Date.(data[!,:Date], "d/m/y")
println(first(sort(data, :Date), 3),"\n")

println(first(filter(row -> row[:Price] > 50000, data),3 ),"\n")

#categorical!(data, :Grade)
data[!, :Grade] = categorical(data[!, :Grade])
println(first(data, 3), "\n")

println(
#    by(data, :Grade, :Price => 
#        x -> ( NumSold=length(x), AvgPrice=mean(x)) )
    combine(
        groupby(data, :Grade), 
        :Price=> (x -> [length(x) mean(x)]) => [:NumSold, :AvgPrice] 
        )
)