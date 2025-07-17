using JLD
using HDF5

function Data_Generation(JOB, MACHINE, index)

    p = rand(10:30, JOB, MACHINE)

    println("p = $p")

    filenm = join(["Data/PFSP/Ins_", string(JOB), "_", string(MACHINE), "_", string(index), ".jld"])
    save(filenm, "JJ", JOB, "MM", MACHINE, "pp", p)
end

for J in [80]
    for M in [5]
        for i in [4]
            Data_Generation(J, M, i)
        end
    end
end

# Data_Generation(20, 6, 2, 16, 1)