using DataFrames, CSV, Statistics
data = CSV.read("data/purchaseData.csv", DataFrame)

rowsKeep = .!(ismissing.(data.Grade) .& ismissing.(data.Price))
data = data[rowsKeep, :]

replace!(x -> ismissing(x) ? "QQ" : x, data.Name)
replace!(x -> ismissing(x) ? "31/06/2008" : x, data.Date)

grPr = combine(groupby(dropmissing(data), :Grade), 
    :Price=> (x -> round(mean(x), digits=-3)) => :AvgPrice)

d = Dict(grPr[:,1] .=> grPr[:,2])
nearIndx(v, x) = findmin(abs.(v.-x))[2]
for i in 1:nrow(data)
    if ismissing(data[i, :Price]) 
        data[i, :Price] = d[data[i, :Grade]]
    end
    if ismissing(data[i, :Grade])
        data[i, :Grade] = grPr[ nearIndx(grPr[:,2], data[i, :Price]), :Grade]
    end   
end

println(first(data, 5), "\n")
println(describe(data))