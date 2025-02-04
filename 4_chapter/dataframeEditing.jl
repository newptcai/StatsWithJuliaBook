using DataFrames, CSV
data1 = CSV.read("data/purchaseData.csv", DataFrame)
data2 = CSV.read("data/purchaseData.csv", DataFrame, copycols=true)

# The following line is obsolete. 
# Now you don't need to `copycols=true` anymore.
try data1[1, :Name] = "YARDEN" catch; @warn "Cannot: data1 is immutable" end 

data2[1, :Name] = "YARDEN"
println("\n", first(data2, 3), "\n")

data1[!, :Price] ./= 1000 
rename!(data1, :Price=>Symbol("Price(000's)"))
println(first(data1, 3), "\n")

replace!(data2[!,:Grade], ["E"=>"F", "D"=>"E"]...)
println(first(data2, 3),"\n")