using DataFrames, CSV
data = CSV.read("data/purchaseData.csv", DataFrame)

newCol = DataFrame(Validated=ones(Int, size(data,1)))
newRow = DataFrame([["JOHN", "JACK"] [123456, 909595]], [:Name, :PhoneNo])
newData = DataFrame(Name=["JOHN", "ASHELY","MARYANNA"], 
                    Job=["Lawyer", "Doctor","Lawyer"])

data = hcat(data, newCol)
println(first(data, 3), "\n")

data = vcat(data, newRow, cols=:union) 
println(last(data, 3), "\n")

data = innerjoin(data, newData, on=:Name, matchmissing=:equal)
println(data, "\n")

select!(data,[:Name,:Job])
println(data, "\n")

unique!(data,:Job)
println(data)