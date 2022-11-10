function test_file(file_path)
    try
        include(file_path) # path to files
    catch e
        println("Failed: $file_path")
        @show e
    end
end

function test_dir(dir)
    for (root, _, files) in walkdir(dir)
        for file in files
            file_path = joinpath(root, file)
            test_file(file_path)
        end
    end
end


if basename(PROGRAM_FILE) == basename(@__FILE__)
    test_dir(ARGS[1])
end
